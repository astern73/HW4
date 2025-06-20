class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user.id
    
    # Attach the uploaded image if one was provided
    if params["image"]
      @entry.image.attach(params["image"])
    end
    
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end