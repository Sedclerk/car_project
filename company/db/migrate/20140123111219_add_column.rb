class AddColumn < ActiveRecord::Migration
  def change
  	add_column :cars, :year, :integer
  	add_column :cars, :price, :decimal, precision: 8, scale: 2
  end
end