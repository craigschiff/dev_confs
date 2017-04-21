class V1::EventsController < ApplicationController

  def index
    events = Event.all
    render json: events
  end

  def show
    event = Event.find_by(id: params[:id])
    render json: event
  end

  def create
    event = {}
    event[:topic] = Topic.find_or_create_by(name: event_params["topic"])
    event[:organizer] = Organizer.find_or_create_by(name: event_params["organizer"])
    event[:city] = City.find_or_create_by(name: event_params["city"])
    event[:name] = event_params["name"]
    event[:description] = event_params["description"]
    event[:website] = event_params["website"]
    event[:cost] = event_params["cost"]
    event[:perks] = event_params["perks"]
    event[:date] = event_params["date"]
    event[:address] = event_params["address"]
    new_event = Event.create!(event)
    render json: new_event
  end

  def updated
  end

  private
  def event_params
    params.require(:event).permit(:city, :topic, :organizer,
                                  :name, :description, :website,
                                  :cost, :perks, :date, :address)
  end
end
