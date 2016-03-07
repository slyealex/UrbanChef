class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :chef
  has_many :line_items
  has_many :products, through: :line_items

  accepts_nested_attributes_for :line_items


end
