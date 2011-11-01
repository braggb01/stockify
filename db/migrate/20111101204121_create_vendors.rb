class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :brand

      t.timestamps
    end
  end
end
