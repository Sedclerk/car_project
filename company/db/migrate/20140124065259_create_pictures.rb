class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :car_id
      t.integer :position
      t.string :description

      t.timestamps
    end
  end
end
