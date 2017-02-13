class Category < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :parent

  has_many :categories, as: :children_categories
end
