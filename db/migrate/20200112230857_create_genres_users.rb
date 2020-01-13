class CreateGenresUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_users do |t|
      t.integer :genre_id
      t.integer :user_id
    end
  end
end
