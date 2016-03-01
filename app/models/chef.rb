class Chef < ActiveRecord::Base
  has_many :orders
  has_many :products
end
