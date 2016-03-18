class Client < ActiveRecord::Base

  include ActiveModel::Dirty

  has_many :orders
  has_many :chefs, through: :orders
  has_many :products, through: :orders

  has_many :ratings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :client_avatar, ClientAvatarUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?



end
