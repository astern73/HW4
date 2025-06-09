class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.all  # For now, show all places
    else
      redirect_to "/sessions/new"
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user.id })
    else
      redirect_to "/sessions/new"
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end