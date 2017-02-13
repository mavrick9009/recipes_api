class CreateRecipeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_items do |t|
      t.integer :recipe_id, null: false
      t.integer :item_id, null: false

      t.timestamps
    end
  end
end
