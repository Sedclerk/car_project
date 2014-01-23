# encoding: utf-8
namespace :add do
desc "Create year and price data"
task :nine_car => :environment do
Car.create(year: "tester", price: "blah") 
puts "Succesfully worked"
end
end