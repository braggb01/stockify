class Product < ActiveRecord::Base
	belongs_to :vendor
	belongs_to :purchase
	belongs_to :admin_user
	belongs_to :location

	validates :prod_num, :vendor_id, :purchase_id, :quantity, :presence => true
	validates :received, :inclusion => { :in => [true, false] }
end
