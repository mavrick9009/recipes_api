class RecipeTool < ActiveRecord::Base
  validates :equipment_id, presence: true
  validates :recipe_id, presence: true
  belongs_to :equipment
  belongs_to :recipe
end
