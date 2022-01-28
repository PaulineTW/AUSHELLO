class Message < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  ISSUES = ["Wrong name","Wrong address","Wrong email","Wrong website", "Wrong phone number", "Wrong category", "Other"]
end
