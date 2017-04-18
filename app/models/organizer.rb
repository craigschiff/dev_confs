class Organizer < ApplicationRecord
  belongs_to :city
  has_many :events
  has_many :organizer_topics
  has_many :topics, through: :organizer_topics

end
