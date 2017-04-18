class V1::OrganizersController < ApplicationController
  def index
    render json: Organizer.all
  end

  def show
    render json: Organizer.find(params[:id])
  end


end
