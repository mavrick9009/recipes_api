class Step < ActiveRecord::Base
  validates :name, presence: true
  validates :position, presence: true

  belongs_to :recipe

  has_attached_file :image
  validates_attachment_content_type :image, content_type: [/\Aimage/, /video/]
  validates_attachment_file_name :image, matches: [/png\Z/,/gif\Z/, /jpe?g\Z/, /webm\Z/, /mp3\Z/, /mp4\Z/]
  # need to add the step_items model
  # has_many :step_items
  # has_many :items, through: :step_items
end
