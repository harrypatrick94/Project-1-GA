class UsersController < ApplicationController
  # before_action all pages are only visible when logged in except new
  before_action :check_for_user, except: [:new]

  def new
    # create new user
    @user = User.new
  end #new

  def create
    # create user and save to instance varible
    @user = User.create user_params
    # check to see if account created successfully
    if @user.persisted?
      # if user created log them in automatically
      session[:user_id] = @user.id
      # direct user to personal home_page
      redirect_to user_path(@user.id)
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
    @user = User.find params[:id]
  end #show

  private
   #strong params give new and update access to param
  def user_params
  # require and permit user
  params.require(:user).permit(:name, :email, :image, :bio, :password, :password_confirmation)

end
