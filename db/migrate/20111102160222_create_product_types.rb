class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :prod_number
      t.string :brand, :default => 'Cisco'

      t.timestamps
    end
  end
end
