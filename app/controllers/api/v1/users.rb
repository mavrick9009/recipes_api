module API
  module V1
    class Users < Grape::API
      resource :users do

        desc "Get All public Recipes"
        get do
          authenticate!
          status :ok
          #recipes.map { |recipe| RecipeSerializer.new(recipe) }
        end

        desc "Get a Recipe full detail"
        params do
          requires :id, desc: "Recipe ID", type: Integer
        end
        get ":id" do
          authenticate!
          user = User.find(params[:id])
          authorize! :update, user
          if(user.present?)
            status :ok
            CurrentUserSerializer.new(user)
          else
            status :no_content
          end
        end

        desc "Create a Recipe"
        params do
          requires :recipe, type: Hash do
            requires :name, desc: "Name", type: String
            optional :description, desc: "Description", type: String
          end
        end
        post do
          name = params[:recipe].delete("name")
          description = params[:recipe].delete("description") || ""
          recipe = Recipe.new(name: name, description: description)
          if(recipe.save)
            status :ok
            RecipeFullSerializer.new(recipe)
          else
            status :no_content
          end
        end

        desc "Update a Recipe"
        params do
          requires :user, type: Hash do
            requires :id, desc: "Id", type: Integer
            optional :first_name, desc: "Name", type: String
            optional :last_name, desc: "Description", type: String
            optional :email, desc: "Description", type: String
          end
        end
        put ":id" do
          puts params
          authenticate!
          user = User.find(params[:user][:id])
          authorize! :update, user
          first_name = params[:user].delete("first_name")
          last_name = params[:user].delete("last_name")
          email = params[:user].delete("email")

          if(user.update(first_name: first_name, last_name: last_name, email: email))
            status :ok
            CurrentUserSerializer.new(user)
          else
            status :unprocessable_entity
          end
        end


      #end class
      end
    end
  end
end
