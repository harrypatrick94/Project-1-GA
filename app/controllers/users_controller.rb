class UsersController < ApplicationController
  # before_action all pages are only visible when logged in except new
  before_action :check_for_user, except: [:new]

  
end
