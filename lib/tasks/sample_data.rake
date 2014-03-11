namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_vendors
    make_addresses
  end
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
  primary = Vendor.find(1).addresses.build(street1: "3760 Lilly Rd",
               city: "Brookfield",
               state: "WI",
               zip: "53005",
               is_primary: true)
  primary.save

  5.times do |n|
    street1  = Faker::Name.name
    city = Faker::Name.name
    
    newAddress = Vendor.find(2).addresses.build(street1: street1,
                 city: city,
                 state: "WI",
                 zip: 53005,
                 types: "['sales']")      
    newAddress.save
  end
end


