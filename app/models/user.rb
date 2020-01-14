class User < ApplicationRecord
  has_many :genres

  after_create :give_user_default_genres

  def give_user_default_genres
    rasie "hell"
     give the new user some default values
    # current_user << jazz << blues << rock

  end

  has_secure_password
end
