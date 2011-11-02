class Purchase < ActiveRecord::Base
	has_many :products, :dependent => :destroy
	belongs_to :admin_user

	validates :po_number, :admin_user_id, :presence => true
	validates :complete, :inclusion => { :in => [true, false] }

	after_save :add_products_to_inventory

	#def add_products_to_inventory
  	#if received?
      #self.each do |product|
        #Inventory.find_by_product_type_id(product.product_type_id).update_attribute(:quantity, product.quantity)
      #end
    #end
  #end

	def add_products_to_inventory
  	if complete?
      self.products.each do |product|
        Inventory.find_by_product_type_id(product.product_type_id).update_attribute(:quantity, product.quantity)
      end
    end
  end
end
