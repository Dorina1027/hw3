class EntriesController < ApplicationController

  def new
    @entry = Entry.new
    @place_id = params.fetch("place_id")
    render({ :template => "entries/new" })
  end

  def create
    @entry = Entry.new
    @entry.title = params.fetch("title")
    @entry.description = params.fetch("description")
    @entry.posted_on = params.fetch("posted_on")
    @entry.place_id = params.fetch("place_id")

    @entry.save

    redirect_to("/places/#{@entry.place_id}")
  end

end
