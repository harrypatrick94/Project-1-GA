class GenresController < ApplicationController

  # CRUD

  # CREATE
  # 1. new
  def new
    @genre = Genre.new
  end
  # 2. create
  def create
    genre = Genre.create genre_params

    redirect_to genres_path
  end

  # READ
  # Index of everthing
  def index
    @genres = Genre.all
  end
  # show individual db
  def show
    @genre = Genre.find params[:id]
  end

  # UPDATE
  # 1. prefilled form
  def edit
    @genre = Genre.find params[:id]

  end
  # 2. udpate
  def update
    # find the genre to be edited
    genre = Genre.find params[:id]
    # edit genre
    genre.update genre_params

    redirect_to genre_path(genre.id)
  end
  # DESTROY
  def destroy

  end
  private
def genre_params
  params.require(:genre).permit(:name, :description)
end
end
