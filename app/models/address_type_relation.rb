class AddressTypeRelation < ActiveRecord::Base
	belongs_to :address
	belongs_to :addresstype

	validates :address_id, presence: true
	validates :addresstype_id, presence: true
end
