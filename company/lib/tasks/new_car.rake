 
namespace :add do
desc "Create a new car"
task :changed_car => :environment do
Car.create(make: "Renault", model: "4l")
puts "Succesfully created a new car"
end
end







