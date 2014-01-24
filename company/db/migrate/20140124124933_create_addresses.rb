class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state, limit: 2
      t.integer :zip_code, limit: 5

      t.timestamps
    end
  end
end
