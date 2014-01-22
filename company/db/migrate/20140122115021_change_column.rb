class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :cars, :description, :text, :null => false
  end
end
