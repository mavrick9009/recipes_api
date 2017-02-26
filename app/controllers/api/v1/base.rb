module API
  module V1
    class Base < Grape::API
      mount API::V1::Sessions
      mount API::V1::Recipes
      mount API::V1::Users
    end
  end
end
