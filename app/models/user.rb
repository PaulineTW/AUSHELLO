class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resources
  has_many :favourites, through: :favourites, source: :resources
  acts_as_favoritor

  def admin?
    seff.name == "admin"
  end

end
