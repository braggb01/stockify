class Product < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :admin_user
	belongs_to :location
	belongs_to :product_type

	validates :product_type_id, :purchase_id, :quantity, :presence => true
	validates :received, :inclusion => { :in => [true, false] }

	after_save :add_products_to_inventory


	#def add_products_to_inventory
		#i = Inventory.find_by_product_type_id(product_type_id)
		#if received?
			#i.quantity += quantity
			#i.save
		#end
	#end

	def add_products_to_inventory
		i = ProductType.find_by_id(product_type_id)
		if received?
			i.total_quantity += quantity
			i.save
		end
	end
end
