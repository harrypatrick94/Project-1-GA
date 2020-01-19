class User < ApplicationRecord
  has_many :genres

  after_create :give_user_default_genres


    #Tell geocoder where to look to get the human readable address string
    geocoded_by :address
    #tell geocoder to actually turn above address into a lat and long (from remote api)
    # any time you create or update Dog item
    after_validation :geocode


  def give_user_default_genres
    # rasie "hell"
    # give the new user some default values
    # current_user << jazz << blues << rock

  end

  has_secure_password
end
