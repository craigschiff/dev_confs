class Topic < ApplicationRecord
  has_many :events
  has_many :rsvps, through: :events
  has_many :profiles, through: :rsvps

end
