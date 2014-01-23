Project 18:

1. Create a database migration to add a “description” column to the cars table.

Last login: Wed Jan 15 11:20:17 on ttys003
Rubis:) cd /Users/Sedclerk/Desktop/company 
Rubis:) rails generate migration add_description_to_cars description:text
      invoke  active_record
      create    db/migrate/20140115082925_add_description_to_cars.rb
Rubis:) rake db:migrate
==  AddDescriptionToCars: migrating ===========================================
-- add_column(:cars, :description, :text)
   -> 0.0332s
==  AddDescriptionToCars: migrated (0.0332s) ==================================


 
2. Setup “validations” to require that a car must have a (make, model, description) in order to be saved. 

here is the validation that i entered in Car.rb model

validates :make, :model, :description, :presence => {:message => "empty value found, it can't be blank"}


3. Create a rake task like in the previous project but name it car_task18.rake


I did



4. In the rake you should try and create a car without a make and model. Does it save to the database?

I tried and create a car without a make and model, in my terminal , here is the output:

Last login: Tue Jan 21 19:08:45 on ttys000
Rubis:) cd /Users/Sedclerk/Desktop/test2014/company
Rubis:) rake add:new_car18
[deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
Succesfully created a new car without make and model
Rubis:)

so in my database table called "cars" , after calling rake add:new_car18 from terminal and look into the database, then the new car couldn t be created, here it is:


here it also my rake file :
namespace :add do
    desc "Create a new car"
    task :new_car18 => :environment do
        Car.create( description: "2x2")
        puts "Succesfully created a new car without make and model"
    end
end

and inside my model car which contains the validation on make and model, here it is:

class Car < ActiveRecord::Base
    
    validates :make, :model ,:presence => {:message => "empty value found, it can't be blank"}
    
end





Last login: Tue Jan 21 19:46:45 on ttys000
Rubis:) mysql -u company -p company_development
Enter password:
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 25
Server version: 5.6.11 MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show tables;
+-------------------------------+
| Tables_in_company_development |
+-------------------------------+
| add_cars                      |
| cars                          |
| infos                         |
| messages                      |
| schema_migrations             |
+-------------------------------+
5 rows in set (0.00 sec)

mysql> select * from cars;
+----+-------------+------------+---------------------+---------------------+-------------+
| id | make        | model      | created_at          | updated_at          | description |
+----+-------------+------------+---------------------+---------------------+-------------+
|  1 | BMW         | E30        | 2014-01-15 07:39:13 | 2014-01-15 07:45:08 | NULL        |
|  2 | Ford        | Aveo       | 2014-01-15 07:45:57 | 2014-01-21 12:44:56 | Cool        |
|  4 | Renault     | Express    | 2014-01-15 07:49:59 | 2014-01-15 07:50:36 | NULL        |
|  5 | Toyota      | TruenoAE86 | 2014-01-20 16:36:11 | 2014-01-20 16:36:11 | NULL        |
|  6 | Daewoo      | 4WD        | 2014-01-21 10:16:39 | 2014-01-21 10:16:39 | 4x4         |
|  8 | Limo        | GTX        | 2014-01-21 10:35:33 | 2014-01-21 10:35:33 | 4x4         |
|  9 | Lexus       | GTI        | 2014-01-21 12:36:52 | 2014-01-21 12:36:52 | Awesome     |
| 10 | Lexus 2     | GTD        | 2014-01-21 12:40:20 | 2014-01-21 12:40:20 | Awesome     |
| 11 | Lambourgini | Airborn    | 2014-01-21 12:40:20 | 2014-01-21 12:40:20 | Super       |
+----+-------------+------------+---------------------+---------------------+-------------+
9 rows in set (0.01 sec)

mysql>


According to it, it couldn t be saved into the database caused by the presence validation of a make and model.end


5. How do you know if a record actually gets saved or not (without manually looking into the database)?
    
    For me , I will actually know it if the output from terminal gives me a notification if i want to skip the validation( that means it detects that there is a validation that we didn t respect ) like this : for instance let s take the previous question as we try to create a car without make and model then here is the result :
    
    rake add:new_car18
    [deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
    Succesfully created a new car without make and model
    
Let's create a new rake task called test_data.rake to see on what will happen to find out if it gets saved
    
    here is the inside the test_data.rake file
    
    namespace :add do
        desc "Create a new car"
        task :test_car => :environment do
            Car.create(make: "Audi", model: "GT", description: "Speed")
            puts "Succesfully created a new car"
        end
    end
    
    and here is the output from terminal
    
    Rubis:) rake add:test_car
    Succesfully created a new car
    Rubis:)
    
    I won t get any notification the if i need to skip validation. and also i use puts to find out if it went thru or not. here i worked and get saved to the database eventhough i m not lokking into the database.if
    
    6. If an ActiveRecord object is not saved, it stores errors on the object. Print out those errors. Meaning inside your rake file if the object you are trying to create doesn’t save properly puts out its error messages.

    here is how it deal with it:
    
    My validation in my car model:
    
    class Car < ActiveRecord::Base
    
    validates :make, :model ,:presence => {:message => "empty value found, it can't be blank"}
    
end


My rake file :

namespace :add do
    desc "Create a new car"
    task :new_car18 => :environment do
        c = Car.create( description: "2x2")
        puts "Succesfully created a new car without make and model"
        puts c.errors[:make]
        puts c.errors[:model]
    end
end


here is the output from my terminal as i tested it.

Rubis:) rake add:new_car18
[deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
Succesfully created a new car without make and model
empty value found, it can't be blank
Rubis:)


there you go, the error message just pops up : empty value found, it can't be blank
Rubis:)


PART 2

7. Create another migration that changes description to require the field to not be nil.
hint: possible google search “rails migration add not null constraint”


Rubis:) rake db:migrate
==  ChangeColumnNull: migrating ===============================================
-- change_column_null(:cars, :description, false)
-> 0.0195s
==  ChangeColumnNull: migrated (0.0196s) ======================================

==  ChangeColumn: migrating ===================================================
-- change_column(:cars, :description, :text, {:null=>false})
-> 0.0238s
==  ChangeColumn: migrated (0.0239s) ==========================================




8. Modify your rake file and try to save a car without a description. What error is thrown? How is this error different from a validation error?

    
changed the rake file called : new_car.rake on lib/tasks

namespace :add do
    desc "Create a new car"
    task :changed_car => :environment do
        Car.create(make: "Renault", model: "4l")
        puts "Succesfully created a new car"
    end
end

and from the terminal as i call that rake file


'Rubis:) rake add:changed_car
rake aborted!
Mysql2::Error: Field 'description' doesn't have a default value: INSERT INTO `cars` (`created_at`, `make`, `model`, `updated_at`) VALUES ('2014-01-22 12:46:26', 'Renault', '4l', '2014-01-22 12:46:26')
/Users/Sedclerk/Desktop/test2014/company/lib/tasks/new_car.rake:14:in `block (2 levels) in <top (required)>'
Tasks: TOP => add:changed_car
(See full trace by running task with --trace)

we can see that here is a raise errors from mysql validation. and the previous errors was from a model validation. 











Rubis:) rails console
Loading development environment (Rails 4.0.1)
irb(main):001:0> c=Car.new
=> #<Car id: nil, make: nil, model: nil, created_at: nil, updated_at: nil, description: nil>
irb(main):002:0> c.save
   (0.3ms)  BEGIN
[deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
   (0.2ms)  ROLLBACK
=> false
irb(main):003:0> c=Car.create
   (0.3ms)  BEGIN
   (0.2ms)  ROLLBACK
=> #<Car id: nil, make: nil, model: nil, created_at: nil, updated_at: nil, description: nil>
irb(main):004:0> c.save
   (0.3ms)  BEGIN
   (0.2ms)  ROLLBACK
=> false
irb(main):005:0> 

here is the database :

mysql> select * from cars;
+----+---------+---------+---------------------+---------------------+-------------+
| id | make    | model   | created_at          | updated_at          | description |
+----+---------+---------+---------------------+---------------------+-------------+
|  1 | BMW     | E30     | 2014-01-15 07:39:13 | 2014-01-15 07:45:08 | NULL        |
|  2 | Nissan  | Terrano | 2014-01-15 07:45:57 | 2014-01-15 07:46:42 | NULL        |
|  4 | Renault | Express | 2014-01-15 07:49:59 | 2014-01-15 07:50:36 | NULL        |
+----+---------+---------+---------------------+---------------------+-------------+
3 rows in set (0.00 sec)

Here it appears that the new car that we created was not saved into the Database because
it will only shows that we have 3 ROWS NOT 4 or 5 ("3 rows in set (0.00 sec)")

4. How do you know if a record actually gets saved or not (without manually looking into the database)? 


For me in order to find out if the database that i created on terminal was saved or not is 
is by watching carefully the output i got from rails consol for instance:

Here is the terminal with creation a new car

irb(main):003:0> c=Car.create
   (0.3ms)  BEGIN
   (0.2ms)  ROLLBACK
=> #<Car id: nil, make: nil, model: nil, created_at: nil, updated_at: nil, description: nil>
irb(main):004:0> c.save
   (0.3ms)  BEGIN
   (0.2ms)  ROLLBACK
=> false

The first thing that i expected is that after i saved it , normaly it should give TRUE, but if it s false
i will look to the errors by typing "c.errors" which gives me the whole errors like this:

irb(main):005:0> c.errors
=> #<ActiveModel::Errors:0x007fed41f5d7d8 @base=#<Car id: nil,
 make: nil, model: nil, created_at: nil, updated_at: nil, 
 description: nil>, @messages={:make=>["empty value found, it can't be blank"], :model=>["empty value found, it can't be blank"], :description=>["empty value found, it can't be blank"]}>
irb(main):006:0> 

But if i want to see the specific errors that causes it , i will find out by doing this:

irb(main):006:0> c.errors[:make]
=> ["empty value found, it can't be blank"]
irb(main):007:0> c.errors[:model]
=> ["empty value found, it can't be blank"]
irb(main):008:0> c.errors[:description]
=> ["empty value found, it can't be blank"]
irb(main):009:0> 

Time: 15mn

Thanks

    
    PROJECT 19
    

    Project 19
    Part 1:
    1. Create a database migration that adds two columns to the “cars” table. The columns are “year and price”. Year should be an integer and price should be a decimal.
    
    Last login: Thu Jan 23 11:49:36 on ttys001
    Rubis:) cd /Users/Sedclerk/Desktop/test2014/company
    Rubis:) cd /Users/Sedclerk/Desktop/test2014/19/company
    Rubis:) rake db:migrate
    ==  AddColumn: migrating ======================================================
    -- add_column(:cars, :year, :integer)
    -> 0.0352s
    -- add_column(:cars, :price, :decimal, {:precision=>8, :scale=>2})
    -> 0.0314s
    ==  AddColumn: migrated (0.0668s) =============================================
    
    Rubis:)
    
    and here is what i added to the migration file :

class AddColumn < ActiveRecord::Migration
def change
  	add_column :cars, :year, :integer
  	add_column :cars, :price, :decimal, precision: 8, scale: 2
end
end

2. Create a rake task and try the following command: Car.create(year: ‘tester’, price: ‘blah’).i created a rake file called : 19.rake

namespace :add do
    desc "Create year and price data"
    task :nine_car => :environment do
        Car.create(year: ‘tester’, price: ‘blah’)
        puts "Succesfully worked"
    end
end

What happens? ( rake aborted here is the output from terminal as i run rake add:nine_car)

Rubis:) rake add:nine_car
rake aborted!
rake aborted!
invalid byte sequence in US-ASCII

(See full trace by running task with --trace)
Rubis:)


Does it create a car?

i creates nothing as we can see here from database :

mysql> select * from cars;
+----+-------------+------------+---------------------+---------------------+-------------+------+-------+
| id | make        | model      | created_at          | updated_at          | description | year | price |
+----+-------------+------------+---------------------+---------------------+-------------+------+-------+
|  1 | BMW         | E30        | 2014-01-15 07:39:13 | 2014-01-15 07:45:08 | Voila       | NULL |  NULL |
|  2 | Ford        | Aveo       | 2014-01-15 07:45:57 | 2014-01-21 12:44:56 | Cool        | NULL |  NULL |
|  4 | Renault     | Express    | 2014-01-15 07:49:59 | 2014-01-15 07:50:36 | Boom        | NULL |  NULL |
|  5 | Toyota      | TruenoAE86 | 2014-01-20 16:36:11 | 2014-01-20 16:36:11 | Baam        | NULL |  NULL |
|  6 | Daewoo      | 4WD        | 2014-01-21 10:16:39 | 2014-01-21 10:16:39 | 4x4         | NULL |  NULL |
|  8 | Limo        | GTX        | 2014-01-21 10:35:33 | 2014-01-21 10:35:33 | 4x4         | NULL |  NULL |
|  9 | Lexus       | GTI        | 2014-01-21 12:36:52 | 2014-01-21 12:36:52 | Awesome     | NULL |  NULL |
| 10 | Lexus 2     | GTD        | 2014-01-21 12:40:20 | 2014-01-21 12:40:20 | Awesome     | NULL |  NULL |
| 11 | Lambourgini | Airborn    | 2014-01-21 12:40:20 | 2014-01-21 12:40:20 | Super       | NULL |  NULL |
| 12 | Audi        | GT         | 2014-01-21 17:09:25 | 2014-01-21 17:09:25 | Speed       | NULL |  NULL |
| 13 | Audi        | GT         | 2014-01-21 18:28:54 | 2014-01-21 18:28:54 | mlay        | NULL |  NULL |
+----+-------------+------------+---------------------+---------------------+-------------+------+-------+
11 rows in set (0.00 sec)

mysql>

there should be a 14th id for the latest one we just created .



BY THE WAY, I WAS WRONG FROM THE ABOVE I MENTIONED

FROM PART TWO AS I CREATED THOSE MIGRATION, I REALIZE THAT WAS NOT NORMAL. SO BECAUSE OF THAT THE RAKE ABORTED TWICE WAS THERE FOR A BIG REASON. AS I WORKED ON IT , I FOUND OUT THE SOLUTION. WHICH IS ADDING # encoding: utf-8 FROM THE RAKE I JUST CREATED AND BY DOING SO I DIDN T GET THAT DOUBLE RAKE ABORTED ANYMORRE BUT INSTEAD , I HAD THIS :

Rubis:) rake add:nine_car
rake aborted!
undefined local variable or method `‘tester’' for main:Object
/Users/Sedclerk/Desktop/test2014/19/company/lib/tasks/19.rake:5:in `block (2 levels) in <top (required)>'
Tasks: TOP => add:nine_car
(See full trace by running task with --trace)


HERE I REALIZED THAT ANOTHER MISTAKE I VE MADE WAS THAT I PUT SINGLE QUOTE INSTEAD OF DOUBLE QUOTES ON THE VALUE OF YEAR COLUMNS AND PRICE. SO I FIXED THAT

Rubis:) rake add:nine_car
[deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
Succesfully worked
Rubis:)

IT SHOWS THAT THE VALIDATION HAD WORKED.


If so, what gets stored in the year and price?

from the last id we were trying to create , i didn t go thru so with the previous id , there just "NULL" . iT happened because first when we created make and model, we ve set validations of presence and on the description columns we set a null constraint . and lastly we still added in the year column isn t an integer and the price wasn t a decimal so that is why we ve got a double rake aborted.in


3. Add validations to cars to require that year and price be a number.

i added a requirement to the model car, here is what i added ( number with allow null)

validates :year, :price , :numericality => true, :allow_nil => true


Part 2:
1. Create another migration that adds additional columns to the cars table. Including

from the terminal :

Rubis:) rails g migration AddColumnsToCars transmission:string  vin:string mileage:integer exterior_color:string interior_color:string body_type:string doors:integer
invoke  active_record
create    db/migrate/20140123115335_add_columns_to_cars.rb
Rubis:)

and here is from the migrated file :

class AddColumnsToCars < ActiveRecord::Migration
    def change
        add_column :cars, :transmission, :string
        add_column :cars, :vin, :string
        add_column :cars, :mileage, :integer
        add_column :cars, :exterior_color, :string
        add_column :cars, :interior_color, :string
        add_column :cars, :body_type, :string
        add_column :cars, :doors, :integer
    end
end

and rake db:migrate succesfully :

Rubis:) rake db:migrate
==  AddColumnsToCars: migrating ===============================================
-- add_column(:cars, :transmission, :string)
-> 0.0314s
-- add_column(:cars, :vin, :string)
-> 0.0283s
-- add_column(:cars, :mileage, :integer)
-> 0.0161s
-- add_column(:cars, :exterior_color, :string)
-> 0.0169s
-- add_column(:cars, :interior_color, :string)
-> 0.0245s
-- add_column(:cars, :body_type, :string)
-> 0.0175s
-- add_column(:cars, :doors, :integer)
-> 0.0171s
==  AddColumnsToCars: migrated (0.1523s) ======================================

Part 3:
Add validations to the car model. These validations should include:

1. transmission should only allow ‘Manual’ or ‘Automatic’
validates :transmission, :presence => true, :if => " Manual||Automatic? " end

2. mileage should be a number and should be greater than or equal to zero

validates :mileage, :numericality => {:greater_than => 0}


3. body_type can only be “Convertible”, “Coupe”, “Hatchback”, “Sedan”, “SUV”,
“Truck”, “Minivan”, “Van”, “Wagon”

validates_inclusion_of :field, :in => [Convertible, Coupe,Hatchback , Sedan, SUV, Truck, Minivan, Van, Wagon], :allow_nil => true, :presence => true


4. Doors must be greater than or equal to zero


validates_numericality_of :Doors, :presence => true, :only_integer => true, :greater_than_or_equal_to => 0




