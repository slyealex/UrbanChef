class AddLongitudeAndLatitudeToChef < ActiveRecord::Migration
  def change
    add_column :chefs, :longitude, :decimal, precision: 9, scale: 6
    add_column :chefs, :latitude, :decimal, precision: 9, scale: 6 

  end
end
