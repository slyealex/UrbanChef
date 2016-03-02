class AddColumnsToChef < ActiveRecord::Migration
  def change
    add_column :chefs, :name, :string
    add_column :chefs, :experience, :text
    add_column :chefs, :location, :string
  end
end
