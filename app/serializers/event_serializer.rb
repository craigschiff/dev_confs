class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :website, :submission_deadline, :presenters, :address, :perks, :cost, :submission_sales_date, :ticket_sales_date

  belongs_to :city
  belongs_to :organizer
  belongs_to :topic
  has_many :rsvps
end
