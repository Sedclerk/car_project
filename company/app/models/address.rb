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
