class Message < ApplicationRecord
  belongs_to :user
  belongs_to :resource
end
