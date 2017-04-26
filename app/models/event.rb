class Event < ApplicationRecord
  belongs_to :city, optional: true
  has_many :comments
  belongs_to :topic
  belongs_to :organizer
  validates :name, uniqueness: true
end
