class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_items
  has_many :items, through: :recipe_items
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  has_many :recipe_tools
  has_many :equipment, through: :recipe_tools
  has_many :steps

  has_attached_file :image
  validates_attachment_content_type :image, content_type: [/\Aimage/, /video/]
  validates_attachment_file_name :image, matches: [/png\Z/,/gif\Z/, /jpe?g\Z/, /webm\Z/, /mp3\Z/, /mp4\Z/]
end
