ActiveAdmin.register Product do
	menu :parent => "Purchase Orders", :priority => 2

  index do
    column "Product #", :sortable => :prod_num do |product|
			link_to product.prod_num, admin_product_path(product)
		end
		column "Status", :sortable => :received do |product|
			 status_tag (product.received ? "Received" : "Pending"), (product.received ? :ok : :error)
		end
		column "Quantity Received", :quantity, :sortable => false
		column("Location Stored") { |product| product.location.room unless product.location.blank? }
    column :date_received
    column "Received By", :admin_user, :sortable => false
    default_actions
  end

	form do |f|
		f.inputs "New Product" do
			f.input :purchase, :label => "Purchase Order:", :collection => Purchase.all, :label_method => :po_number
			f.input :prod_num, :label => "Product #:"
			f.input :vendor, :label => "Manufacturer:", :collection => Vendor.all, :label_method => :brand
			f.input :quantity, :label => "Quantity:"
			f.input :location, :label => "Location Stored:",  :collection => Location.all, :label_method => :room
			f.input :admin_user, :label => "Received By:"
			f.input :received
			f.input :date_received, :label => "Date Received:", :as => :datepicker
		end
		f.buttons
	end

	filter :vendor, :label => "MANUFACTURER:", :collection => Vendor.all, :label_method => :brand
	filter :admin_user, :label => "RECEIVED BY:"
	filter :purchase, :label => "PURCHASE ORDER:",  :collection => Purchase.all, :label_method => :po_number
	filter :location, :label => "LOCATION STORED:", :collection => Location.all, :label_method => :room
	filter :prod_num, :label => "PRODUCT #:"
	filter :date_received
	
	scope :Pending, :default => true do |products|
		products.where('received == ?', false)
	end
	scope :Received do |products|
		products.where('received == ?', true)
	end
end
