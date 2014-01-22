namespace :add do
desc "Create a new car"
task :part2_car => :environment do
Car.create(make: "Audi", model: "GT")
puts "Succesfully created a new car without a description"
end
end