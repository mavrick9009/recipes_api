module API
  module V1
    class Sessions < Grape::API
      resource :sessions do

        desc "Sign in user."
        params do
          requires :email, desc: "User's email address", type: String
          requires :password, desc: "User's password", type: String
        end
        post "/" do
          user = User.find_by(email: params[:email])

          if user && user.valid_password?(params[:password])
            status :created
            sign_in(user)
            CurrentUserSerializer.new(user)
          else
            status :unauthorized
            { message: I18n.t('devise.failure.invalid') }
          end
        end

        desc "Validate the session."
        get "/validate" do
          # authenticate!
          CurrentUserSerializer.new(current_user)
        end

        desc "Sign out user."
        delete "/" do
          authenticate!
          sign_out(current_user)
          status :ok
        end
      end
    end
  end
end
