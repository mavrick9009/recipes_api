module API
  module V1
    class Recipes < Grape::API
      resource :recipes do

        desc "Get All public Recipes"
        get do
          recipes = Recipe.all
          status :ok
          recipes.map { |recipe| RecipeSerializer.new(recipe) }
        end

        desc "Get a Recipe full detail"
        params do
          requires :id, desc: "Recipe ID", type: Integer
        end
        get ":id" do
          authenticate!
          recipe = Recipe.find(params[:id])
          if(recipe.present?)
            status :ok
            RecipeFullSerializer.new(recipe)
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
          requires :recipe, type: Hash do
            requires :id, desc: "Id", type: Integer
            requires :name, desc: "Name", type: String
            optional :description, desc: "Description", type: String
          end
        end
        put ":id" do
          authenticate!
          recipe = Recipe.find(params[:id])
          authorize! :update, recipe
          name = params[:recipe].delete("name")
          description = params[:recipe].delete("description") || ""
          if(recipe.update(name: name, description: description))
            status :ok
            RecipeFullSerializer.new(recipe)
          else
            status :unprocessable_entity
          end
        end


      #end class
      end
    end
  end
end
