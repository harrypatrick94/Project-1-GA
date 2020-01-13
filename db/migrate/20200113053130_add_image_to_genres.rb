class AddImageToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :image, :text
  end
end
