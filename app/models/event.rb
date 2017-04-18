class Event < ApplicationRecord
  belongs_to :city
  has_many :rsvps
  has_many :profiles, through: :rsvps
  belongs_to :topic
  belongs_to :organizer

end
