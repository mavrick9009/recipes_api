class RecipeItem < ActiveRecord::Base
  validates :item_id, presence: true
  validates :recipe_id, presence: true
  belongs_to :item
  belongs_to :recipe
end
