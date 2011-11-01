class Vendor < ActiveRecord::Base
	has_many :products

	validates :brand, :presence => true
end
