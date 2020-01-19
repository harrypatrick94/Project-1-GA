class ArtistsController < ApplicationController

  def map
    @artist = Artist.find params[:artist_id]
    concerts = @artist.concerts
    @concerts = concerts.select(:name, :latitude, :longitude)
    
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
