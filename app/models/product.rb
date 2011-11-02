class Product < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :admin_user
	belongs_to :location
	belongs_to :product_type

	validates :product_type_id, :purchase_id, :quantity, :presence => true
	validates :received, :inclusion => { :in => [true, false] }

	after_save :add_products_to_inventory

	#def add_products_to_inventory
  	#if received?
      #self.each do |product|
        #Inventory.find_by_product_type(product.product_type).update_attribute(:quantity, product.quantity)
      #end
    #end
  #end

	def add_products_to_inventory
  	if received?
      Inventory.find_by_product_type(product.product_type).update_attribute(:quantity, product.quantity)
    end
  end
end
