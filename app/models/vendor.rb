class Vendor < ActiveRecord::Base
	has_many :vendor_address_relationships, foreign_key: "vendor_id", dependent: :destroy
	has_many :addresses, through: :vendor_address_relationships, source: :address


    validates(:name,  {presence: true, length: { maximum: 50 } } )

  	def add_address!(address)
		if (!(self.addresses.find_by(id: address.id)))
			vendor_address_relationships.create!(address_id: address.id)
		end
	end

	def remove_address!(address)
		self.addresses.find_by(id: address.id).destroy
	end

	def clear_addresses!()
		addresses.each(&:destroy)
		vendor_address_relationships.destroy_all
	end
end
