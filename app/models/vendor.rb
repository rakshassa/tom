class Vendor < ActiveRecord::Base
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses, allow_destroy: true,
			reject_if: :all_blank

	serialize :types
	serialize :products_provided
	serialize :product_types			

    validates(:name,  {presence: true, length: { maximum: 50 } } )
    #validates :website, :uri => true
    validates :phone, :allow_blank => true, format: { with: /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?/, message: "bad format" }
    validates :fax, :allow_blank => true, format: {   with: /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/, message: "bad format" }


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
