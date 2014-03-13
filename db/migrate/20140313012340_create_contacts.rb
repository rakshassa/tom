class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :vendor_id
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :fax
      t.string :cell
      t.string :email

      t.timestamps
    end

    add_index :contacts, :vendor_id
  end
end
