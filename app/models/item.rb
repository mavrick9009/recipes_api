class Item < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_items
  has_many :recipes, through: :recipe_items

  # need to add the step_items model
  # has_many :step_items
  # has_many :steps, through: :step_items
end
