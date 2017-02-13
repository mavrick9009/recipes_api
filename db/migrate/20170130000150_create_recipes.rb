class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|

      t.string :name, null: false
      t.string :description

      t.integer :user_id #creator

      t.timestamps
    end
  end
end
