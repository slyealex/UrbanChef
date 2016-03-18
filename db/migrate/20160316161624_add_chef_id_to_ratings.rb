class AddChefIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :chef_id, :integer
  end
end
