namespace :add do
desc "Create a new car"
task :new_car18 => :environment do
c = Car.create( description: "2x2")
puts "Succesfully created a new car without make and model"
puts c.errors[:make]
puts c.errors[:model]
end
end