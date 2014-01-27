Project 20:

Prerequisites:
Read http://guides.rubyonrails.org/association_basics.html

Part 1:
1. Create a model called “Picture” and a table called “pictures” (using migrations). A picture should have the following fields:
car_id: integer
position: integer
description: string

From my terminal:

Last login: Thu Jan 23 17:56:42 on ttys000
Rubis:) cd /Users/Sedclerk/Desktop/test2014/20/company
Rubis:) rails g model Picture car_id:integer position:integer description:string
invoke  active_record
create    db/migrate/20140124065259_create_pictures.rb
create    app/models/picture.rb
invoke    test_unit
create      test/models/picture_test.rb
create      test/fixtures/pictures.yml
Rubis:) rake db:migrate
==  CreatePictures: migrating =================================================
-- create_table(:pictures)
-> 0.0672s
==  CreatePictures: migrated (0.0673s) ========================================



2. Setup a “has-many” relationship between cars and pictures.

i added this to my car model : "has_many :pictures" and added this "belongs_to :car" to the picture model

3. Create a rake task that creates a car and adds 3 pictures to it. (Don’t worry about actual picture files, just put a picture name as the description).

i created a rake task called : "picture.rake" . ( might be wrong but let me know still )

from terminal :

Rubis:) rake add:picture_car
rake aborted!
/Users/Sedclerk/Desktop/test2014/20/company/lib/tasks/picture.rake:8: syntax error, unexpected tSTRING_BEG, expecting keyword_do or '{' or '('
puts "Succesfully created a new car"
^
/Users/Sedclerk/Desktop/test2014/20/company/Rakefile:6:in `<top (required)>'
(See full trace by running task with --trace)
Rubis:) rake add:picture_car
rake aborted!
Mysql2::Error: Field 'description' doesn't have a default value: INSERT INTO `cars` (`created_at`, `make`, `model`, `price`, `updated_at`, `year`) VALUES ('2014-01-24 09:31:30', 'Asia', '5l', 15000.0, '2014-01-24 09:31:30', 2013)
/Users/Sedclerk/Desktop/test2014/20/company/lib/tasks/picture.rake:4:in `block (2 levels) in <top (required)>'
Tasks: TOP => add:picture_car
(See full trace by running task with --trace)
Rubis:) rake add:picture_car
Succesfully created a new car
Rubis:) rails s


4. Loop through all the cars in your database and print out the picture description for each car.
i added this to my index page :

<table border="1", cellpadding="15", align="center">
<tr>
<th>Make</th>&nbsp;&nbsp;&nbsp;

<th>Model</th>&nbsp;&nbsp;&nbsp;

<th>Pictures</th>
</tr>


<% Car.all.each do |car|%>
    <% Picture.all.each do |picture|%>
        <tr>
        <td width="40%"><%= car.make %></td>&nbsp;&nbsp;&nbsp;
        <td width="20%"><%= car.model %></td>&nbsp;&nbsp;&nbsp;
        <td width="20%"><%= picture.description %></td>&nbsp;&nbsp;&nbsp;
        </tr>
        <% end %>
    <% end %>

</table>  ( might be wrong but let me know still , please correect me?)



Part 2:
1. Create an Address model and an addresses table. An address should have the following fields:
address_1: string
address_2: string
city: string
state: string  (this field should be limited to two characters, both in migration and a model validation)
zip_code: integer (this field should be limited to 5, both in the migration and in the model validation)


this is what i came up with :

Rubis:) rails g model Address address_1:string address_2:string city:string state:string{2} zip_code:integer{5}
invoke  active_record
create    db/migrate/20140124124933_create_addresses.rb
create    app/models/address.rb
invoke    test_unit
create      test/models/address_test.rb
create      test/fixtures/addresses.yml
Rubis:) rake db:migrate
==  CreateAddresses: migrating ================================================
-- create_table(:addresses)
-> 0.0395s
==  CreateAddresses: migrated (0.0396s) =======================================


and here is my address model validation :

class Address < ActiveRecord::Base
	belongs_to :cars
	validates :state, length: { is: 2 }
	validates :zip_code, length: { in: 3..5 }
end


2. Setup a “has_one” relationship between Cars and Address. In other words, a Car should have one address.

i added this into the car model "has_one :addresses" and address model "belongs_to :cars"


3. Inside your rake task, create an address for one of your cars, then retrieve the same car and print out its address.

here is the modified rake :

namespace :add do
    desc "Create a new picture"
    task :picture_car => :environment do
        Car.create( make: "Asia", model: "5l", description: "tsara", year: "2013", price: "15000")
        Picture.create(car_id: "14", position: "6", description: "Center_profile.jpg")
        Picture.create(car_id: "14", position: "6", description: "Right_profile.jpg")
        Picture.create(car_id: "14", position: "6", description: "left_profile.jpg")
        Address.create( address_1: "Vt 85 Vf", address_2:"Tana", state:"UK", zip_code:"86354")
        a=Car.find(14)
        puts "Succesfully found a car number 14"
        puts a
        
        
        puts "Succesfully created a new car"
    end
end



Resources:
