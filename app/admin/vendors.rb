ActiveAdmin.register Vendor do
  menu :parent => "Administration", :priority => 3

  index do
    column "Manufactured By" do |vendor|
			link_to vendor.brand, admin_vendor_path(vendor)
		end
    default_actions
  end
end
