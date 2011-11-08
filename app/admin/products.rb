ActiveAdmin.register Product do
	menu :parent => "Purchase Orders"

  index do
    column "Product #", :sortable => :product_type_id do |product|
			link_to product.product_type.prod_number, admin_product_path(product)
		end
		#column("Purchase Order") { |product| product.purchase.po_number }
		column "Purchase Order", :sortable => :purchase_id do |product|
			link_to product.purchase.po_number, admin_purchase_order_path(product.purchase_id)
		end
		column "Status", :sortable => :received do |product|
			 status_tag (product.received ? "Received" : "Pending"), (product.received ? :ok : :error)
		end
		column "Quantity Ordered", :quantity, :sortable => false
		column("Location Stored") { |product| product.location.room unless product.location.blank? }
    column :date_received
    column "Received By", :admin_user, :sortable => false
    default_actions
  end

	show do |product|
		attributes_table do
			row "Product Type:" do
				product.product_type.prod_number
			end
			row "Brand:" do
				product.product_type.brand
			end
			row "Purchase Order:" do
				product.purchase.po_number
			end
			row "Quantity:" do 
				product.quantity
			end
			row "Location Stored:" do
				product.location.room unless product.location.blank?
			end
			row "Received By:" do
				product.admin_user unless product.admin_user.blank?
			end
			row "Date Received:" do
				product.date_received unless product.date_received.blank?
			end
		end
		active_admin_comments
	end

	form do |f|
		f.inputs "New Product" do
			f.input :purchase, :label => "Purchase Order:", :collection => Purchase.all, :label_method => :po_number
			#f.input :prod_num, :label => "Product #:"
			f.input :product_type, :label => "Product #:", :collection => ProductType.all, :label_method => :prod_number
			f.input :quantity, :label => "Quantity:"
			f.input :location, :label => "Location Stored:",  :collection => Location.all, :label_method => :room
			f.input :admin_user, :label => "Received By:"
			f.input :received
			f.input :date_received, :label => "Date Received:", :as => :datepicker
		end
		f.buttons
	end

	#filter :vendor, :label => "MANUFACTURER:", :collection => Vendor.all, :label_method => :brand
	filter :product_type, :label => "MANUFACTURER:",  :collection => ProductType.all, :label_method => :brand
	filter :admin_user, :label => "RECEIVED BY:"
	filter :purchase, :label => "PURCHASE ORDER:",  :collection => Purchase.all, :label_method => :po_number
	filter :location, :label => "LOCATION STORED:", :collection => Location.all, :label_method => :room
	#filter :prod_num, :label => "PRODUCT #:"
	filter :product_type, :label => "PRODUCT #:",  :collection => ProductType.all, :label_method => :prod_number
	filter :date_received
	
  scope :all, :default => true
	scope :Pending do |products|
		products.where('received = ?', false)
	end
	scope :Received do |products|
		products.where('received = ?', true)
	end
end
