class AddLongitudeAndLatitudeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :longitude, :decimal, precision: 9, scale: 6
    add_column :clients, :latitude, :decimal, precision: 9, scale: 6
  end
end
