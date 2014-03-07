class CreateAddresstypes < ActiveRecord::Migration
  def change
    create_table :addresstypes do |t|
      t.string :name

      t.timestamps
    end

  end
end
