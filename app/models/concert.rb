class Concert < ApplicationRecord
  #Tell geocoder where to look to get the human readable address string
  geocoded_by :address
  #tell geocoder to actually turn above address into a lat and long (from remote api)
  # any time you create or update Dog item
  after_validation :geocode
end
