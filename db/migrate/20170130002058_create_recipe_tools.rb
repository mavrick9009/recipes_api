class CreateRecipeTools < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_tools do |t|

      t.integer :recipe_id, null: false
      t.integer :tool_id, null: false
      t.timestamps
    end
  end
end
