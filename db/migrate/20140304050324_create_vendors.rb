class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :types
      t.integer :year_established
      t.string :website
      t.string :duns
      t.string :naics
      t.string :phone
      t.string :fax
      t.text :products_provided
      t.text :product_types
      t.string :terms
      t.boolean :certified
      t.date :last_audit
      t.date :cert_expire
      t.text :audit_findings

      t.timestamps
    end
  end
end
