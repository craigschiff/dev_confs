class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,
  :date, :website, :address, :perks, :cost,
  :city, :organizer, :topic, :image
  has_many :rsvps

end
