class AddIndexToProduct < ActiveRecord::Migration
  def change
		add_index(:products, [:product_type_id, :admin_user_id], :name => "index_products_on_product_type_id")
  end
end
