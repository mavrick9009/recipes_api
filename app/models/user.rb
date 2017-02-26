class User < ActiveRecord::Base
  include STIPredicateable

  #before_save :update_token
  #acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true
  validates :type, presence: true

  has_many :favorites
  has_many :recipes, through: :favorites

  def generate_new_token
    token = Devise.friendly_token
    self.update_attributes!(authentication_token: token)
  end
  private
  def update_token
    token = Devise.friendly_token
    self.authentication_token = token
  end
end
