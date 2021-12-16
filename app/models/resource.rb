class Resource < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true
  validates : :name, :category, :address, :website, :phone, :state, :email, :description, presence: true
  validates :category, inclusion: { in: ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day" ]}
end
