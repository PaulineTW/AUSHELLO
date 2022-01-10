class Resource < ApplicationRecord
  belongs_to :user
  # has_many :favourites, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :address, :website, :state, presence: true
  # validates :phone, length: { is: 10 }
  # validates :categories, inclusion: { in: ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day", "Financial help", "Community"]}
  # CATEGORIES = ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day", "Financial help", "Community"]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :categories

  include PgSearch::Model
    pg_search_scope :search,
    against: [ :name, :description, :state, :address ],
    using: {
      tsearch: { prefix: true,
                any_word: true
      }
    }

  # def self.search(query)
  #   if query.present?
  #     search(query)
  #   else
  #     order("resources.name ASC")
  #   end
  # end
end
