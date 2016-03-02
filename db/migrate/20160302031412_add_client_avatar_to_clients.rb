class AddClientAvatarToClients < ActiveRecord::Migration
  def change
    add_column :clients, :client_avatar, :string
  end
end
