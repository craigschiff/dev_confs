class OrganizerSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :events
  belongs_to :city
end
