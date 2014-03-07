class Address < ActiveRecord::Base
	has_many :address_type_relations, foreign_key: "address_id", dependent: :destroy
	has_many :address_types, through: :address_type_relations, source: :Addresstype

	has_one :vendor_address_relationships, foreign_key: "address_id", dependent: :destroy
	has_one :vendor, through: :vendor_address_relationships, source: :Vendor


	validates(:street1,  {presence: true, length: { maximum: 30 } } )
	validates(:street2,  {length: { maximum: 50 } } )
	validates(:city,  {presence: true, length: { maximum: 30 } } )
	validates(:state,  {presence: true, length: { maximum: 2 } } )

# why was there an 'i' character trailing the reg_ex?
	VALID_ZIP_REGEX = /\d{5}(?:[-\s]\d{4})?/
	validates(:zip,  {presence: true, 
		format:     { with: VALID_ZIP_REGEX },
		length: { maximum: 10 } } )

	def add_type!(type)
		if (!(self.address_types.find_by(id: type.id)))
			address_type_relations.create!(addresstype_id: type.id)
		end
	end

	def clear_types!()
		address_type_relations.destroy_all
	end

	def type?(type)
		self.address_types.find_by(id: type.id)
	end
end
