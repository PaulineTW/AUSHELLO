class Resource < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :favourited_by, through: :favourites, source: :user
  validates :name, uniqueness: true
  validates :name, :address, :website, :state, presence: true
  # validates :phone, length: { is: 10 }
  # validates :categories, inclusion: { in: ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day", "Financial help", "Community"]}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :categories
    acts_as_favoritable

end
