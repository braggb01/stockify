class AddLocationIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :location_id, :integer
  end
end
