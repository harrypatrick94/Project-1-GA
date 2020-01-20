class CreateConcertsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts_users do |t|
      t.integer :concerts
      t.integer :users
    end
  end
end
