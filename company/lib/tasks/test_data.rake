namespace :add do
desc "Create a new car"
task :test_car => :environment do
Car.create(make: "Audi", model: "GT", description: "Speed")
puts "Succesfully created a new car"
end
end