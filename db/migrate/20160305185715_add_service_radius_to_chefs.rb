class AddServiceRadiusToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :service_radius, :integer
  end
end
