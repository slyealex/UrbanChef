class AddSpecialtyToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :specialty, :string
  end
end
