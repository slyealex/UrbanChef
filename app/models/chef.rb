class Chef < ActiveRecord::Base

  include ActiveModel::Dirty

  has_many :products
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :products

  mount_uploader :chef_avatar, ChefAvatarUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

end
