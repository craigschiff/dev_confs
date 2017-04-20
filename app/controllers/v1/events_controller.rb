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
    event[:topic] = Topic.create(name: event_params["topic"])
    event[:organizer] = Organizer.create(name: event_params["organizer"])
    event[:city] = City.create(name: event_params["city"])
    event[:name] = event_params["name"]
    event[:description] = event_params["description"]
    event[:website] = event_params["website"]
    event[:cost] = event_params["cost"]
    event[:perks] = event_params["perks"]
    event[:date] = event_params["date"]
    new_event = Event.create!(event)
    render json: Event.all
    byebug
  end

  private
  def event_params
    params.require(:event).permit(:city, :topic, :organizer,
                                  :name, :description, :website,
                                  :cost, :perks, :date)
  end
end
