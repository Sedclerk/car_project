class Car < ActiveRecord::Base

validates :make, :model, :description, :presence => {:message => "empty value found, it can't be blank"}

end
