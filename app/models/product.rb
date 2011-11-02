class Product < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :admin_user
	belongs_to :location
	belongs_to :product_type

	validates :product_type_id, :purchase_id, :quantity, :presence => true
	validates :received, :inclusion => { :in => [true, false] }
end
