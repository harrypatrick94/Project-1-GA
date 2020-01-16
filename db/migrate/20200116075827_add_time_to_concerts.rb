class AddTimeToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :time, :text
  end
end
