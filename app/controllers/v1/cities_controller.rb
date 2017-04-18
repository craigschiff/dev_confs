class V1::CitiesController < ApplicationController

  def index
    cities = City.all
    render json: cities
  end

  def show
    city = City.find_by(id: params[:id])
    render json: city
  end

end
