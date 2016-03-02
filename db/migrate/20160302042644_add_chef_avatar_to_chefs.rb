class AddChefAvatarToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :chef_avatar, :string
  end
end
