class Address < ActiveRecord::Base
	belongs_to :cars
	validates :state, length: { is: 2 }
	validates :zip_code, length: { in: 3..5 }
end
