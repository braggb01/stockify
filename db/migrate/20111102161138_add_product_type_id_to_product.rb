class AddProductTypeIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_type_id, :integer
  end
end
