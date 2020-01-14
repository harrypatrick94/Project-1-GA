class GenresController < ApplicationController
  before_action :check_for_user
  # CRUD

  # CREATE
  # 1. new
  def new
    @genre = Genre.new
    @user_id = @current_user.id

  end
  # 2. create
  def create

    genre = Genre.create genre_params
    @current_user.genres << genre

    redirect_to user_path(@current_user.id)
  end

  # READ
  # Index of everthing
  def index
    @genres = Genre.all
  end
  # show individual db
  def show
    # raise "Hell"
    @genre = Genre.find params[:id]
    @genre_id = @genre.id
    # raise "Hell"
  end

  # UPDATE
  # 1. prefilled form
  def edit
    @genre = Genre.find params[:id]

  end
  # 2. udpate
  def update
    # find the genre to be edited
    # genre = Genre.find params[:id]
    # edit genre
    # raise 'hell'
    genre = @current_user.genres.find params[:id]
    genre.update genre_params

    redirect_to genre_path(genre.id)
  end
  # DESTROY
  def destroy
    Genre.destroy params[:id]

    redirect_to user_path(@current_user.id)
  end
  private
def genre_params
  params.require(:genre).permit(:name, :description, :image)
end
end
