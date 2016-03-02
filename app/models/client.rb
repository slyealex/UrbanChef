class Client < ActiveRecord::Base
  has_secure_password
  has_many :orders

  mount_uploader :client_avatar, ClientAvatarUploader

end
