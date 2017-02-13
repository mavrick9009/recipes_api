class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :name, null: false
      t.text :definition 
      t.timestamps
    end
  end
end
