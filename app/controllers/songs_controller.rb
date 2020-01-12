class SongsController < ApplicationController

    # CRUD

    # CREATE
    # 1. new
    def new
      @song = Song.new
    end
    # 2. create
    def create
      Song.create song_params

      redirect_to genres_path
    end

    # READ
    # Index of everthing
    def index
      @songs = Song.all
    end
    # show individual db
    def show
      @song = Song.find params[:id]
    end

    # UPDATE
    # 1. prefilled form
    def edit
      @song = Song.find params[:id]

    end
    # 2. udpate
    def update
      # find the songs to be edited
      song = Song.find params[:id]
      # edit genre
      song.update song_params

      redirect_to song_path(song.id)
    end
    # DESTROY
    def destroy

    end
    def song_params
      params.require(:song).permit(:name, :artist, :sheet, :genre_id)
    end
end
