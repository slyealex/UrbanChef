class Chef < ActiveRecord::Base

  include ActiveModel::Dirty

  has_many :products
  has_many :orders
  has_many :clients, through: :orders
  has_many :line_items, through: :orders

  has_many :ratings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :products

  mount_uploader :chef_avatar, ChefAvatarUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def product_totals
    product_total_hash = self.line_items.group(:product_id).size
    new_hash = {}
    product_total_hash.each do |k, v|
      product_name = Product.find(k).name
      new_hash[product_name] = v
    end
    new_hash
  end

  def serving_chefs_average_rating
    ((self.ratings.sum :rating)/(self.ratings.count :rating)).to_i
  end


end
