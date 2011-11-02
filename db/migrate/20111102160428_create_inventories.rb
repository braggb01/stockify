class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.integer :product_type_id

      t.timestamps
    end
  end
end
