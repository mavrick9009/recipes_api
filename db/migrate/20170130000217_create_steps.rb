class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|

      t.integer :recipe_id, null: false
      t.integer :position, null: false
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
