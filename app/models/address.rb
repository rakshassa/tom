class Address < ActiveRecord::Base

	belongs_to :vendor
	serialize :types


	validates(:street1,  {presence: true, length: { maximum: 30 } } )
	validates(:street2,  {length: { maximum: 50 } } )
	validates(:city,  {presence: true, length: { maximum: 30 } } )
	validates(:state,  {presence: true, length: { maximum: 2 } } )

	VALID_ZIP_REGEX = /\d{5}(?:[-\s]\d{4})?/
	validates(:zip,  {presence: true, 
		format:     { with: VALID_ZIP_REGEX },
		length: { maximum: 10 } } )


end
