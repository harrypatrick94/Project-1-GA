class ConcertsController < ApplicationController

  def map
    # all conerts need address
    @concerts = Concert.select(:name, :latitude, :longitude)
    # raise "hell"
  end

end
