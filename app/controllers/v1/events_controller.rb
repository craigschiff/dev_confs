class V1::EventsController < ApplicationController

  def index
    events = Event.includes(:city, :topic, :organizer)
    render json: events
  end

  def show
    event = Event.find_by(id: params[:id])
    render json: event
  end

  def create
    event = make_event(Event.new, event_params)
    event.organizer = Organizer.find_or_create_by(name: params["organizer"])
    event.city = City.find_or_create_by(name: params["city"])
    event.save
    byebug
    render json: event
  end

  def update
    event = make_event(Event.find_by(id: params[:id]), event_params)
    event.save
    render json: event
  end

  private
  def make_event(event, params)
    event.topic = Topic.find_or_create_by(name: params["topic"])
    event.name = params["name"]
    event.description = params["description"]
    event.website = params["website"]
    event.cost = params["cost"]
    event.perks = params["perks"]
    event.date = params["date"]
    event.address = params["address"]
    event
  end

  def event_params
    params.require(:event).permit(:city, :topic, :organizer,
                                  :name, :description, :website,
                                  :cost, :perks, :date, :address)
  end
end
