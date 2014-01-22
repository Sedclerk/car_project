class ChangeColumnNull < ActiveRecord::Migration
  def change
  	change_column_null :cars, :description, false
  end
end
