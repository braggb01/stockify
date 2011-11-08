ActiveAdmin.register ProductType do
  menu :label => "Inventory", :priority => 2

  index do
    column "Product", :sortable => :prod_number do |product_type|
			link_to product_type.prod_number, admin_product_type_path(product_type)
		end
		column "Description", :prod_desc, :sortable => false
    column :brand
    #column :total_quantity
	  column "Actual Stock", :sortable => :total_quantity do |product_type|
			if product_type.total_quantity < product_type.needed_quantity
				status_tag product_type.total_quantity.to_s, :error
			else
				product_type.total_quantity.to_s
			end
		end
    column :needed_quantity
    default_actions
  end

end
