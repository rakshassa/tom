class Vendor < ActiveRecord::Base
	has_many :addresses, dependent: :destroy


    validates(:name,  {presence: true, length: { maximum: 50 } } )

  	def add_address!(address)
		if (!(self.addresses.find_by(id: address.id)))
			addresses.create!(address)
		end
	end

	def remove_address!(address)
		self.addresses.find_by(id: address.id).destroy
	end

	def clear_addresses!()
		addresses.each(&:destroy)
	end
end
