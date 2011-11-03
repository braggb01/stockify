class Purchase < ActiveRecord::Base
	has_many :products, :dependent => :destroy
	belongs_to :admin_user

	validates :po_number, :admin_user_id, :presence => true
	validates :complete, :inclusion => { :in => [true, false] }


end
