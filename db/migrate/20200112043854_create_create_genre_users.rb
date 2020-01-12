class CreateCreateGenreUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :create_genre_users do |t|
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
