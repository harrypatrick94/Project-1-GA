class SessionController < ApplicationController
  def new
  end

  def create
    # create a session (period of logged in)
    #  get email and user by email
    user = User.find_by email: params[:email]
    # if email matches user in db check password of user
    if user.present? && user.authenticate(params[:password])
      # create new session save the id of session user
      session[:user_id]
      # go to home page of the user
      redirect_to user_path(user.id)
    else
      # fail login
      flash[:error] = "Invalid email or password"
      #  redirect to login page
      redirect_to loggin_path
    end # if
  end # create


  def destroy
    # set session id pf user to nil
    session[:user_id] = nil
    # redirect to login page
    redirect_to loggin_path
  end # destroy
end #SessionController
