class CategoryRecipe < ActiveRecord::Base
  validates :category_id, presence: true
  validates :recipe_id, presence: true
  belongs_to :category
  belongs_to :recipe
end
