class AddressTypeRelation < ActiveRecord::Base
	belongs_to :Address
	belongs_to :Addresstype

	validates :address_id, presence: true
	validates :addresstype_id, presence: true
end
