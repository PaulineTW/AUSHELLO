class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resources
  has_many :favourites, through: :favourites, source: :resources
  acts_as_favoritor

end
