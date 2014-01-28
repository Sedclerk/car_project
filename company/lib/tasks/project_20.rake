namespace :add do
desc "Create a new picture"
task :picture_car => :environment do
Car.create( make: "Asia", model: "5l", description: "tsara", year: "2013", price: "15000")
Picture.create(car_id: "14", position: "6", description: "Center_profile.jpg")
Picture.create(car_id: "14", position: "6", description: "Right_profile.jpg")
Picture.create(car_id: "14", position: "6", description: "left_profile.jpg")
#Address.create( car_id: "14", address_1: "Vt 85 Vf", city:"Tana", state:"UK", zip_code:"86354")

Address.first.car.pictures.each{|pic| puts “pic.description”}

car = Car.first.address.create(address_1: "Vt 85 Vf", city: "Tana", state: "UK", zip:"86354")
puts car.address.address_1

puts "Succesfully created a new car"


end
end
