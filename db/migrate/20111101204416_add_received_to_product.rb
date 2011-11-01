class AddReceivedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :received, :boolean
  end
end
