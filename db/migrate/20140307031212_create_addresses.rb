class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.boolean :is_primary
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end


  end
end
