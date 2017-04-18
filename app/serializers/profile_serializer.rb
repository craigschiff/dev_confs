class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :skills, :portfolio
  belongs_to :city
  has_many :events
end
