class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.text :make
      t.text :model
      t.text :description, , :null => false
      t.timestamps
    end
  end
end
