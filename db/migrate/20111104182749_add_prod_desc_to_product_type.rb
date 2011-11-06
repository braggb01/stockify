class AddProdDescToProductType < ActiveRecord::Migration
  def change
    add_column :product_types, :prod_desc, :text
  end
end
