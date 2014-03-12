namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_address_types
    make_business_types
    make_products
    make_product_types

    make_vendors    
    make_addresses
  end
end

def make_products
  Product.create(name: "Service")
  Product.create(name: "Distributor")
  Product.create(name: "Consultant")
  Product.create(name: "Shipper")
  Product.create(name: "Custom Part MFG")
end

def make_product_types
  ProductType.create(name: "Machining")
  ProductType.create(name: "Plastics")
  ProductType.create(name: "Hardware")
  ProductType.create(name: "Seals")
  ProductType.create(name: "Plating")
  ProductType.create(name: "Heat Treat")
  ProductType.create(name: "Electrical")
  ProductType.create(name: "Misc.")
  ProductType.create(name: "Packaging")
  ProductType.create(name: "Magnets")
  ProductType.create(name: "Stamping")
  ProductType.create(name: "Springs")
  ProductType.create(name: "Consulting")
  ProductType.create(name: "Shipping")
  ProductType.create(name: "Calibration")
end


def make_business_types
  BusinessType.create(name: "Individual")
  BusinessType.create(name: "Corporation")
  BusinessType.create(name: "Partnership")
  BusinessType.create(name: "Female owned")
  BusinessType.create(name: "Minority owned")
  BusinessType.create(name: "other")
end

def make_address_types
  AddressType.create!(name: "Sales")
  AddressType.create!(name: "Manufacturing")
  AddressType.create!(name: "Billing")
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


