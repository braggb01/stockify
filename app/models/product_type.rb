class ProductType < ActiveRecord::Base
	has_many :products
  validates_uniqueness_of :prod_number
end
