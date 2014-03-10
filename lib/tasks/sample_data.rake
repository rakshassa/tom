namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_addresses
    make_addresstypes
    make_vendors

    make_relationships
  end
end

def make_relationships
  Vendor.find(1).add_address!(Address.find(1))
  Address.find(1).add_type!(Addresstype.find(1))

  Vendor.find(2).add_address!(Address.find(2))
  Vendor.find(2).add_address!(Address.find(3))
  Address.find(2).add_type!(Addresstype.find(2))
  Address.find(2).add_type!(Addresstype.find(3))

  Vendor.find(3).add_address!(Address.find(4))
  Vendor.find(3).add_address!(Address.find(5))

end

def make_vendors
  Vendor.create!(name: "Sample Vendor")
  Vendor.create!(name: "Second Vendor")
  Vendor.create!(name: "Third Vendor")

  35.times do |n|
    Vendor.create!(name: Faker::Name.name )
  end
end


def make_addresses
  primary = Address.create!(street1: "3760 Lilly Rd",
               city: "Brookfield",
               state: "WI",
               zip: "53005",
               is_primary: true)
  5.times do |n|
    street1  = Faker::Name.name
    city = Faker::Name.name
    
    Address.create!(street1: street1,
                 city: city,
                 state: "WI",
                 zip: 53005)      
  end
end

def make_addresstypes
  Addresstype.create!(name: "sales")
  Addresstype.create!(name: "manufacturing")
  Addresstype.create!(name: "billing")
end

