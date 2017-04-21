class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,
  :date, :website, :address, :perks, :cost,
  :city, :organizer, :image

  belongs_to :city, serializer: CitySerializer
  belongs_to :organizer, serializer: OrganizerSerializer
  belongs_to :topic, serializer: TopicSerializer
  has_many :rsvps

end
