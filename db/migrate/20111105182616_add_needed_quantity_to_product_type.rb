class AddNeededQuantityToProductType < ActiveRecord::Migration
  def change
    add_column :product_types, :needed_quantity, :integer, :default => 0
  end
end
