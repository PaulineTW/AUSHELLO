class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resources
  has_many :favourites
  has_many :favourite_resources, through: :favourites, source: :resource
  # acts_as_favoritor

end
