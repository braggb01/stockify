class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :po_number
      t.date :date_ordered
      t.boolean :complete

      t.timestamps
    end
  end
end
