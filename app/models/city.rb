class City < ApplicationRecord
  has_many :events
  has_many :profiles
  has_many :organizers
end
