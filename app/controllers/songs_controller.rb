class SongsController < ApplicationController

    # CRUD

    # CREATE
    # 1. new
    def new
      @song = Song.new
      @genre = Genre.find params[:id]
      @genre_name = @genre.name
      @genre_id = @genre.id
      
    end
    # 2. create
    def create
      Song.create song_params
      last_id = Song.last.genre_id

      redirect_to genre_path(last_id)
    end

    # READ
    # Index of everthing
    def index
      @songs = Song.all
    end
    # show individual db
    def show
      song = Song.find params[:id]
      @genre_id = song.genre_id
      genre = Genre.find @genre_id
      @genre_name = genre.name
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

      song = Song.find params[:id]
      genre_id = song.genre_id

      Song.destroy params[:id]
      # find the id of song being deleted the saved and use it

      redirect_to genre_path(genre_id)
    end
    def song_params
      params.require(:song).permit(:name, :artist, :sheet, :genre_id, :image)
    end
end
