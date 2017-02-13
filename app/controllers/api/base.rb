require 'grape-swagger'

module API
  class Base < Grape::API
    format    :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    API_VERSION = "v1"

    # rescue_from CanCan::AccessDenied do |e|
    #   error!(e.message, 403)
    # end

    helpers Devise::Controllers::SignInOut
    #helpers AuthenticationHelper

    helpers do
      def logger
        Rails.logger
      end
    end

    before do

    end

    mount API.const_get(API_VERSION.upcase)::Base

    if Rails.env.development? || Rails.env.staging? || Rails.env.test?
      add_swagger_documentation
      #add_swagger_documentation base_path: '/api', hide_documentation_path: true, api_version: API_VERSION
    end
  end
end
