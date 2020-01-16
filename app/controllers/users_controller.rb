class UsersController < ApplicationController
  # before_action all pages are only visible when logged in except new
  before_action :check_for_user, except: [:new, :create]
  before_action :user_match_id, only: [:show]
  # before_action :log_out_before_login, only: [:new]

  def new
    # create new user
    @user = User.new
  end #new

  def create
    # create user and save to instance varible
    @user = User.create user_params

    if params[:file].present?
      # go to cloudinary ask for the image file
      req = Cloudinary::Uploader.upload(params[:file])
      # query to cloudinary from public id (image id in cloudinary)
      user.image = req["public_id"]
      user.save
    end #if

    # check to see if account created successfully
    if @user.persisted?
      # if user created log them in automatically
      session[:user_id] = @user.id
      # direct user to personal home_page
      redirect_to new_genre_path(@user.id)
    else
      # flash error and appropriate Active record errors
      flash[:errors] = @user.errors.full_messages
      # back to new
      render :new
    end # if


  end # create

  def index
    @users = User.all
  end #index

  def show
# raise "hell"
    @user = User.find params[:id]

  end #show

  def edit
    @user = User.find params[:id]
  end # end

  def update
    # find the songs to be edited
    user = User.find params[:id]
    # edit genre

    user.update user_params
    if params[:file].present?
      # go to cloudinary ask for the image file
      req = Cloudinary::Uploader.upload(params[:file])
      # query to cloudinary from public id (image id in cloudinary)
      user.image = req["public_id"]
      user.save
    end #if

    redirect_to user_path(user.id)
  end # update

  def destroy
    @user = User.find params[:id]
  end
  private
   #strong params give new and update access to param
  def user_params
  # require and permit user
  params.require(:user).permit(:name, :email, :image, :bio, :password, :password_confirmation)
end # end user_params

end # end user controller
