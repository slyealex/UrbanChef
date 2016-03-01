class Product < ActiveRecord::Base
  belongs_to :chef
  has_many :line_items
  has_many :orders, through: :line_items
end
