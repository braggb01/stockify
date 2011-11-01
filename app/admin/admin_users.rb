ActiveAdmin.register AdminUser do
  menu :parent => "Administration", :priority => 1
  index do
		column :username
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
			f.input :username
      f.input :email
			f.input :password
    end
    f.buttons
  end 
end
