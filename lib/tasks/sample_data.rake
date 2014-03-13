namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_address_types
    make_business_types
    make_products
    make_product_types
    make_titles

    make_vendors    
    make_addresses
    make_contacts
  end
end

def make_titles
  Title.create(name: "President")
  Title.create(name: "Sales")
  Title.create(name: "Engineering")
  Title.create(name: "Plant Manager")
  Title.create(name: "Customer Service")
  Title.create(name: "Shipping")
  Title.create(name: "2nd Shift/Afterhours")
  Title.create(name: "Quality Manager")
  Title.create(name: "Contact for NCMR")
  Title.create(name: "A/R Contact")
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
    
    newAddress = Vendor.find(2).addresses.build(
                 street1: Faker::Address.street_address,
                 street2: Faker::Address.secondary_address,
                 city: Faker::Address.city,
                 state: Faker::Address.state_abbr,
                 zip: Faker::Address.zip_code,
                 types: "['sales']")      
    newAddress.save
  end
end

def make_contacts
  primary = Vendor.find(1).contacts.build(
    first_name: "Joe",
    last_name: "Workman",
    phone: "+1 414-524-5696 x444",
    fax: "+91 9582403886",
    cell: "(262) 783-6977",
    email: "test@test.com",
    title: "Sales")
  primary.save

  20.times do |n|
    newContact = Vendor.find(2).contacts.build(
      first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      phone: Faker::PhoneNumber.phone_number,
      fax: Faker::PhoneNumber.cell_phone,
      cell: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email,
      title: "Sales")
    newContact.save
  end
end


