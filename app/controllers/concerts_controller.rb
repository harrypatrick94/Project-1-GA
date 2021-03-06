class ConcertsController < ApplicationController

  def map
    # @drops = Drop.all
    # @drop = Drop.new
    # @line_item_new = LineItem.new
    # all conerts need address
    @concerts = Concert.select(:name, :latitude, :longitude)
    if @current_user.present?
        @local_concerts = Concert.near([@current_user.latitude, @current_user.longitude], 10, unit: :km)
        # raise "hell"
    end

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
    @artists = @concert.artists.all

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
