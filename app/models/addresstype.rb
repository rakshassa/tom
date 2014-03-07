class Addresstype < ActiveRecord::Base
	has_many :address_type_relations, foreign_key: "addresstype_id", dependent: :destroy
	has_many :addresses, through: :address_type_relations, source: :Address

	validates(:name,  {presence: true, length: { maximum: 30 } } )
end
