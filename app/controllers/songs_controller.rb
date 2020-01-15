class SongsController < ApplicationController

    # CRUD

    # CREATE
    # 1. new
    def new
      @song = Song.new
      @genre = Genre.find params[:genre_id]
      @genre_name = @genre.name
      @genre_id = @genre.id
    end
    # 2. create
    def create
      song = Song.create song_params
      last_id = Song.last.genre_id
      if params[:file].present?
        # go to cloudinary ask for the image file
        req = Cloudinary::Uploader.upload(params[:file])
        # query to cloudinary from public id (image id in cloudinary)
        song.image = req["public_id"]

        end #if

        song.save
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
      # raise "hell"
    end

    # UPDATE
    # 1. prefilled form
    def edit

      @song = Song.find params[:id]
      @genre_id = @song.genre_id
      genre = Genre.find @genre_id
      @genre_name = genre.name

    end
    # 2. udpate
    def update
      # find the songs to be edited
      song = Song.find params[:id]
      # edit genre
      genre_id = song.genre_id
      song.update song_params
      if params[:file].present?
        # go to cloudinary ask for the image file
        req = Cloudinary::Uploader.upload(params[:file])
        # query to cloudinary from public id (image id in cloudinary)
        song.image = req["public_id"]

        end #if

        song.save

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
