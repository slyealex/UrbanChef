class AddClientIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :client_id, :integer
  end
end
