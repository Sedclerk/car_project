project 21

Part 1:
1. Inside of your “Address” model, implement the following callbacks. (before_save, after_save, before_create, after_create, before_validation, after_validation, before_destroy, after_destroy)

here is in my address model:

class Address < ActiveRecord::Base
	belongs_to :car
	validates :state, length: { is: 2 }
	validates :zip_code, length: { in: 3..5 }
    before_create :bf_create
    before_save :bf_save
    after_create :af_create
    after_save :af_save
    before_validation :bf_validation
    after_validation :af_validation
    before_destroy :bf_destroy
    after_destroy :af_destroy
    
    
    
    def bf_create
        puts “before create”
    end
    
    def bf_save
        puts “before save!”
    end
    
    def af_create
        puts “after create!”
    end
    
    def af_save
        puts “after save!”
    end
    
    def bf_validation
        puts “before validation!”
    end
    
    def af_validation
        puts “after validation!”
    end
    
    def bf_destroy
        puts “before destroy!”
    end
    
    def af_destroy
        puts “after destroy!”
    end
    
    
    
end



2. Inside a rake file, create / update / destroy are car record. List out the order in which the callbacks run.


" I don t really get your question here " does this work?

Creating an object:



before_create :bf_create
before_save :bf_save
after_create :af_create
after_save :af_save



Updating an object:

before_validation :bf_validation
after_validation :af_validation


Destroying an object :

before_destroy :bf_destroy
after_destroy :af_destroy


and to call it using rails, here is how i can handle it , i will use :

for example :

address = Address.first
address.car.create!
address.Destroy
=> the output should be "after destroy!"



Part 2:
In our addresses table, we want to store states as an abbreviation. For example, “Utah” should be stored as “UT” and “Wyoming” should be stored as “WY”.













