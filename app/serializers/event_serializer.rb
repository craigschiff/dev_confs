class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,
  :date, :website, :address, :perks, :cost

  belongs_to :city
  belongs_to :organizer
  belongs_to :topic
  has_many :rsvps
end
