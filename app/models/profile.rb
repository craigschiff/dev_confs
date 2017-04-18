class Profile < ApplicationRecord
  has_many :rsvps
  has_many :events, through: :rsvps
  # has_many :city_people
  belongs_to :city
  belongs_to :account
end
