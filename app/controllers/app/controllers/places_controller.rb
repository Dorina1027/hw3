class PlacesController < ApplicationController

  def index
    @places = Place.all
    render({ :template => "places/index" })
  end

  def show
    @place = Place.find(params.fetch("id"))
    render({ :template => "places/show" })
  end

  def new
    @place = Place.new
    render({ :template => "places/new" })
  end

  def create
    @place = Place.new
    @place.name = params.fetch("name")

    if @place.save
      redirect_to("/places/#{@place.id}")
    else
      redirect_to("/places")
    end
  end

end
