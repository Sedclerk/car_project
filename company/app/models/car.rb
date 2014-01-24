class Car < ActiveRecord::Base

   has_many :pictures   # A Car has many Pictures 
   has_one :addresses
#validates :make, :model ,:presence => {:message => "empty value found, it can't be blank"}

#validates :year, :price , :numericality => true, :allow_nil => true

#validates :transmission, :presence => true, :if => " Manual||Automatic? " end

#validates :mileage, :numericality => {:greater_than => 0}

#validates_inclusion_of :field, :in => [Convertible, Coupe,Hatchback , Sedan, SUV, Truck, Minivan, Van, Wagon], :allow_nil => true, :presence => true

#validates_numericality_of :Doors, :presence => true, :only_integer => true, :greater_than_or_equal_to => 0



end
                                           