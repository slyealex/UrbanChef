class Chef < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :products

  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

end
