class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,
  :date, :website, :address, :perks, :cost,
  :city, :organizer, :topic
  has_many :rsvps

end
