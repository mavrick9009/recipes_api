class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_items
  has_many :items, through: :recipe_items
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  has_many :recipe_tools
  has_many :equipment, through: :recipe_tools
end
