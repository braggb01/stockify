class ProductType < ActiveRecord::Base
	has_many :inventories
	has_many :products
end
