class ConcertsController < ApplicationController

  def map
    # all conerts need address
    @concerts = Concert.select(:name, :latitude, :longitude)
    # raise "hell"
  end

  # create
  def new
    @concert = Concert.new
  end

  def create
    Concert.create! concert_params

    redirect_to concerts_map_path
  end

  # read
  def index
    @concerts = Concert.all
  end

  def show
    @concert = Concert.find params[:id]

  end

  # update
  def edit
    @concert = Concert.find params[:id]
  end

  def update
    concert = Concert.find params[:id]

    concert.update concert_params

    redirect_to concert_path(concert.id)
  end

  # destroy
  def destroy
    Concert.destroy params[:id]

    redirect_to concerts_path
  end
  private
  def concert_params
    params.require(:concert).permit(:name, :latitude, :longitude, :address, :time)
  end
end
