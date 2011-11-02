class AddAdminUserIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :admin_user_id, :integer
  end
end
