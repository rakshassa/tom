class VendorAddressRelationship < ActiveRecord::Base
	belongs_to :vendor
	belongs_to :address

	validates :address_id, presence: true
	validates :vendor_id, presence: true	
end
