class Event < ApplicationRecord
  belongs_to :city, optional: true
  has_many :rsvps
  has_many :profiles, through: :rsvps
  belongs_to :topic
  belongs_to :organizer

end
