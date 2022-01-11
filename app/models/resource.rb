class Resource < ApplicationRecord
  belongs_to :user
  # has_many :favourites, dependent: :destroy
  # validates :name, uniqueness: true
  validates :name, :state, presence: true
  # validates :phone, length: { is: 10 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :categories

  $categories = ["Legal", "Health", "Housing", "Education", "Visa", "Employment", "Every day", "Financial help", "Community"]

  include PgSearch::Model
    pg_search_scope :search,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true,
                any_word: true
      }
    }

  # include AlgoliaSearch
  # algoliasearch do;  end

end
