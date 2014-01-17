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


3. Try creating a car without adding a description. Does it save to the database?

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





