class RemoveProdNumFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :prod_num
  end

  def down
    add_column :products, :prod_num, :string
  end
end
