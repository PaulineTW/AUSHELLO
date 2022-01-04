class Resource < ApplicationRecord
  belongs_to :user
  # has_many :favourites, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :category1, :address, :website, :state, presence: true
  # validates :phone, length: { is: 10 }
  validates :category1, inclusion: { in: ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day", "Financial help" ]}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
