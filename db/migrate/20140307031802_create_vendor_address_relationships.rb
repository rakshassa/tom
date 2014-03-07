class CreateVendorAddressRelationships < ActiveRecord::Migration
  def change
    create_table :vendor_address_relationships do |t|
      t.integer :vendor_id
      t.integer :address_id

      t.timestamps
    end

    add_index :vendor_address_relationships, :vendor_id
    add_index :vendor_address_relationships, [:vendor_id, :address_id], unique:true
    
  end
end
