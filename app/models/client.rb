class Client < ActiveRecord::Base
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :client_avatar, ClientAvatarUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

end
