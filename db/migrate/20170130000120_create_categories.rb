class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :description
      t.string :parent_id
      t.timestamps
    end
  end
end
