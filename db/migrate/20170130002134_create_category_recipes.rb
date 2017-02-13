class CreateCategoryRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :category_recipes do |t|

      t.integer :category_id, null: false
      t.integer :recipe_id, null: false
      t.timestamps
    end
  end
end
