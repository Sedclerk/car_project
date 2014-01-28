namespace :add do
desc "Create year and price data"
task :twenty1_car => :environment do
c = Car.first
c.address.create(address_1: ‘123 Fake St’, city: ‘Orem’, state:’Utah’)
c.save

c.reload
puts c.address.state #Should print out ‘UT’

end
end