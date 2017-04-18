class CitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :events
  has_many :organizers
end
