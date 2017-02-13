class AddImages < ActiveRecord::Migration
  def change
    add_attachment :categories, :image
    add_attachment :recipes, :image
    add_attachment :users, :image
    add_attachment :items, :image
    add_attachment :steps, :image
    add_attachment :terms, :image
  end
end
