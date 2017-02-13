class Step < ActiveRecord::Base
  validates :name, presence: true
  validates :position, presence: true

  belongs :recipe

  # need to add the step_items model
  # has_many :step_items
  # has_many :items, through: :step_items
end
