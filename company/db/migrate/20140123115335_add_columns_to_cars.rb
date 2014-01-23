class AddColumnsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :transmission, :string
    add_column :cars, :vin, :string
    add_column :cars, :mileage, :integer
    add_column :cars, :exterior_color, :string
    add_column :cars, :interior_color, :string
    add_column :cars, :body_type, :string
    add_column :cars, :doors, :integer
  end
end
