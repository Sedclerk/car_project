class AddDescriptionToCars < ActiveRecord::Migration
  def change
    add_column :cars, :description, :text, :null => false
  end
end
