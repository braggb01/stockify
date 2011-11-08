class AddIndexToProductType < ActiveRecord::Migration
  def change
		#add_index(:product_types, :prod_number, :name => "index_product_types_on_prod_number", :unique => true)
		add_index(:product_types, [:prod_number, :total_quantity, :needed_quantity], :name => "index_product_types_on_prod_number")
  end
end
