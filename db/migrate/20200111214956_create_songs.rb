class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :name
      t.text :artist
      t.text :sheet

      t.timestamps
    end
  end
end
