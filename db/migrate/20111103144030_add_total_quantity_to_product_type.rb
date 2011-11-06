class AddTotalQuantityToProductType < ActiveRecord::Migration
  def change
    add_column :product_types, :total_quantity, :integer, :default => 0
  end
end
