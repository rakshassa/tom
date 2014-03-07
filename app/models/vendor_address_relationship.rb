class VendorAddressRelationship < ActiveRecord::Base
	belongs_to :Vendor
	belongs_to :Address

	validates :address_id, presence: true
	validates :vendor_id, presence: true	
end
