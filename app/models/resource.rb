class Resource < ApplicationRecord
  belongs_to :user
  # has_many :favourites, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :category, :address, :website, :phone, :state, :email, :description, presence: true
  validates :category, inclusion: { in: ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day" ]}
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
