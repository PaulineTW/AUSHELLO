class Resource < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  validates :name, :state, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :categories
  scope :confirmed, -> { where(status: "confirmed") }

  CATEGORIES = ["Legal","Housing","Financial help","Visa", "Everyday", "Education", "Employment", "Health", "Community" ]
  STATES = ["VIC","NSW","QLD","TAS","WA","SA","ACT"]

  def favourited_by_user?(user)
    Favourite.find_by(user: user, resource: self)
  end

  include PgSearch::Model
    pg_search_scope :search,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true,
                any_word: true
      }
    }
end
