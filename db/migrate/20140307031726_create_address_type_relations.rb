class CreateAddressTypeRelations < ActiveRecord::Migration
  def change
    create_table :address_type_relations do |t|
      t.integer :address_id
      t.integer :addresstype_id

      t.timestamps
    end

    add_index :address_type_relations, :address_id
    add_index :address_type_relations, [:address_id, :addresstype_id], unique:true

  end
end
