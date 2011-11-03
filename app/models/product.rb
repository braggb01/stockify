class Product < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :admin_user
	belongs_to :location
	belongs_to :product_type

	validates :product_type_id, :purchase_id, :quantity, :presence => true
	validates :received, :inclusion => { :in => [true, false] }

	after_save :add_products_to_inventory

	#def add_products_to_inventory
  	#if complete?
      #self.products.each do |product|
        #Inventory.find_by_product_type_id(product.product_type_id).update_attribute(:quantity, product.quantity)
      #end
    #end
  #end

	#def add_products_to_inventory
  	#if received? 
      	#Inventory.find_by_product_type_id(product_type_id).update_attribute(:quantity, quantity)
    #end
  #end

	def add_products_to_inventory
		i = Inventory.find_by_product_type_id(product_type_id)
		if received?
			#i.update_attribute(:quantity, i.quantity + quantity)
			i.quantity += quantity
			i.save
		end
	end
end
