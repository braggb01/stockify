class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :prod_num
      t.integer :vendor_id
      t.date :date_received
      t.integer :purchase_id

      t.timestamps
    end
  end
end
