class AddGeocodingFieldsToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :address, :text
    add_column :concerts, :latitude, :float
    add_column :concerts, :longitude, :float
  end
end
