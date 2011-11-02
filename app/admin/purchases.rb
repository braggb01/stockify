ActiveAdmin.register Purchase, :as => "Purchase Order" do
  menu :priority => 1

  index do
    column "PO Number" do |purchase|
			link_to purchase.po_number, admin_purchase_order_path(purchase)
		end
    column :date_ordered
    column "Ordered By", :admin_user
		column "Status", :sortable => :complete do |purchase|
			 status_tag (purchase.complete ? "Complete" : "Pending"), (purchase.complete ? :ok : :error)
		end
    default_actions
  end

	show do
		attributes_table :po_number, :date_ordered, :complete, :admin_user
		panel "Products" do
			table_for purchase_order.products, :sortable => :date_received do |p|
				p.column("Product #") { |product| link_to product.prod_num, admin_product_path(product) }
				p.column("Manufacturer") { |product| product.vendor.brand }
				p.column("Quantity Received") { |product| product.quantity.to_s }
				p.column("Location Stored") { |product| product.location.room unless product.location.blank? }
				p.column("Date Received") { |product| status_tag (product.received ? product.date_received.to_s(:long) : "Has Not Arrived"), (product.received ? :ok : :error) }
				p.column("Accepted By") { |product| product.admin_user.username unless product.admin_user.blank? }
			end
		end
		active_admin_comments
	end

	form do |f|
		f.inputs "New Purchase Order" do
			f.input :admin_user, :label => "Ordered By:"
			f.input :po_number, :label => "PO Number:"
			f.input :date_ordered, :label => "Date Ordered:", :as => :datepicker
			f.input :complete, :label => "All Parts Received?"
		end
		f.buttons
	end

	scope :all, :default => true
	scope :Pending do |purchases|
		purchases.where('complete = ?', false)
	end
	scope :Complete do |purchases|
		purchases.where('complete = ?', true)
	end
end
