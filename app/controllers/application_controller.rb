class ApplicationController < ActionController::Base
  # define fetch users this will set current user
  # run this code in every method of every container
  before_action :fetch_user

  def fetch_user
    # Step 1. check if session[:user_id] is set and valid
    if session[:user_id].present?
    # Step 2. if present save current user as instance globally scoping it
    # making the login status avaliable everywhere
      @current_user = User.find_by id: session[:user_id]
    end
    # Step 2. if id did not return a valid user
    # delete the session (clear the ID from the session HASH)
    unless @current_user.present?
      session[:user_id] = nil

    end
     # raise "hell"
  end # fetch_user

  # def user_match_id
  #   @check_current_user = User.find_by id: session[:user_id]
  #   if @check_current_user.id == session[:user_id]
  #
  #   else
  #     redirect_to user_path(@check_current_user.id)
  #   end # if
  # end # user_match_id

  def user_match_id

    # check to see current user id is equal to the id of who's logged in

    if @current_user.id.present?

      logged_in_user = @current_user.id.to_i
      path_trying_access = params[:id].to_i

      if logged_in_user != path_trying_access
        redirect_to user_path(@current_user.id)
      end
    end

  end # user_match_id

  def log_out_before_login
    if @current_user.id.present?
      redirect_to user_path(@current_user.id)
    end
  end

  def check_for_user
    # Show pages can only be seen by logged in user
    redirect_to login_path unless @current_user.present?
  end # check for user



end # ApplicationController
