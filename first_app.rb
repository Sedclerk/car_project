First i created this

Rubis:) cd ..
Rubis:) cd desktop
Rubis:) rails new first_app -d mysql
create
create  README.rdoc
create  Rakefile
create  config.ru
create  .gitignore
create  Gemfile
create  app 
create  app/assets/javascripts/application.js
create  app/assets/stylesheets/application.css
create  app/controllers/application_controller.rb
create  app/helpers/application_helper.rb
create  app/views/layouts/application.html.erb
create  app/assets/images/.keep
create  app/mailers/.keep
create  app/models/.keep
create  app/controllers/concerns/.keep
create  app/models/concerns/.keep
create  bin
create  bin/bundle
create  bin/rails
create  bin/rake
create  config
create  config/routes.rb
create  config/application.rb
create  config/environment.rb
create  config/environments
create  config/environments/development.rb
create  config/environments/production.rb
create  config/environments/test.rb
create  config/initializers
create  config/initializers/backtrace_silencers.rb
create  config/initializers/filter_parameter_logging.rb
create  config/initializers/inflections.rb
create  config/initializers/mime_types.rb
create  config/initializers/secret_token.rb
create  config/initializers/session_store.rb
create  config/initializers/wrap_parameters.rb
create  config/locales
create  config/locales/en.yml
create  config/boot.rb
create  config/database.yml
create  db
create  db/seeds.rb
create  lib
create  lib/tasks
create  lib/tasks/.keep
create  lib/assets
create  lib/assets/.keep
create  log
create  log/.keep
create  public
create  public/404.html
create  public/422.html
create  public/500.html
create  public/favicon.ico
create  public/robots.txt
create  test/fixtures
create  test/fixtures/.keep
create  test/controllers
create  test/controllers/.keep
create  test/mailers
create  test/mailers/.keep
create  test/models
create  test/models/.keep
create  test/helpers
create  test/helpers/.keep
create  test/integration
create  test/integration/.keep
create  test/test_helper.rb
create  tmp/cache
create  tmp/cache/assets
create  vendor/assets/javascripts
create  vendor/assets/javascripts/.keep
create  vendor/assets/stylesheets
create  vendor/assets/stylesheets/.keep
run  bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching additional metadata from https://rubygems.org/..
Resolving dependencies...
Using rake (10.1.1)
Using i18n (0.6.9)
Using minitest (4.7.5)
Using multi_json (1.8.4)
Using atomic (1.1.14)
Using thread_safe (0.1.3)
Using tzinfo (0.3.38)
Using activesupport (4.0.2)
Using builder (3.1.4)
Using erubis (2.7.0)
Using rack (1.5.2)
Using rack-test (0.6.2)
Using actionpack (4.0.2)
Using mime-types (1.25.1)
Using polyglot (0.3.3)
Using treetop (1.4.15)
Using mail (2.5.4)
Using actionmailer (4.0.2)
Using activemodel (4.0.2)
Using activerecord-deprecated_finders (1.0.3)
Using arel (4.0.1)
Using activerecord (4.0.2)
Using bundler (1.5.2)
Using coffee-script-source (1.7.0)
Using execjs (2.0.2)
Using coffee-script (2.2.0)
Using thor (0.18.1)
Using railties (4.0.2)
Using coffee-rails (4.0.1)
Using hike (1.2.3)
Using jbuilder (1.5.3)
Using jquery-rails (3.1.0)
Using json (1.8.1)
Using mysql2 (0.3.15)
Using tilt (1.4.1)
Using sprockets (2.10.1)
Using sprockets-rails (2.0.1)
Using rails (4.0.2)
Using rdoc (4.1.1)
Using sass (3.2.14)
Using sass-rails (4.0.1)
Using sdoc (0.4.0)
Using turbolinks (2.2.0)
Using uglifier (2.4.0)
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
Rubis:) cd /Users/Sedclerk/Desktop/first_app
Rubis:) rais s
-bash: rais: command not found
Rubis:) rails s
=> Booting WEBrick
=> Rails 4.0.2 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2014-01-30 15:28:21] INFO  WEBrick 1.3.1
[2014-01-30 15:28:21] INFO  ruby 1.9.3 (2013-02-22) [x86_64-darwin12.4.0]
[2014-01-30 15:28:21] INFO  WEBrick::HTTPServer#start: pid=15760 port=3000


Started GET "/" for 127.0.0.1 at 2014-01-30 15:28:25 +0300
Processing by Rails::WelcomeController#index as HTML
Rendered /Users/Sedclerk/.rbenv/versions/1.9.3-p392/lib/ruby/gems/1.9.1/gems/railties-4.0.2/lib/rails/templates/rails/welcome/index.html.erb (2.6ms)
Completed 200 OK in 57ms (Views: 31.0ms | ActiveRecord: 0.0ms)


Started GET "/rails/info/properties" for 127.0.0.1 at 2014-01-30 15:28:28 +0300
Processing by Rails::InfoController#properties as HTML
Rendered /Users/Sedclerk/.rbenv/versions/1.9.3-p392/lib/ruby/gems/1.9.1/gems/railties-4.0.2/lib/rails/templates/rails/info/properties.html.erb (0.4ms)
Completed 200 OK in 18ms (Views: 10.3ms | ActiveRecord: 0.7ms)

and the i worked on this on setting a privilage on a new database name called "first_app_development"

Rubis:) mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.6.11 MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database first_app_development;
Query OK, 1 row affected (0.01 sec)

mysql> use first_app_development
Database changed
mysql> GRANT ALL PRIVILEGES ON first_app_development.*
-> TO 'first_app'@'localhost'
-> IDENTIFIED BY 'Sedclerk13';
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW GRANTS FOR 'first_app'@'localhost';
+------------------------------------------------------------------------------------------------------------------+
| Grants for first_app@localhost                                                                                   |
+------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'first_app'@'localhost' IDENTIFIED BY PASSWORD '*25602F012AABA5ADD2AB0969627DCE8438A01E05' |
| GRANT ALL PRIVILEGES ON `first_app_development`.* TO 'first_app'@'localhost'                                     |
+------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql>  FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

mysql>


after creating it, i configured my database.yml inside my rails app

development:
adapter: mysql2
encoding: utf8
database: first_app_development
pool: 5
username: first_app
password: Sedclerk13
socket: /tmp/mysql.sock

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
adapter: mysql2
encoding: utf8
database: first_app_test
pool: 5
username: root
password:
socket: /tmp/mysql.sock

production:
adapter: mysql2
encoding: utf8
database: first_app_production
pool: 5
username: root
password:
socket: /tmp/mysql.sock


then i set the git with my text editor sublim and updated my first rails app into the master

Rubis:) git config --global alias.co checkout
Rubis:) git config --global core.editor "subl -w"
Rubis:) git init
Initialized empty Git repository in /Users/Sedclerk/first_app/.git/
Rubis:) cd /Users/Sedclerk/Documents/first_app
Rubis:) git init
Initialized empty Git repository in /Users/Sedclerk/Documents/first_app/.git/
Rubis:) cd /Users/Sedclerk/Documents/car_project
Rubis:) git init
Reinitialized existing Git repository in /Users/Sedclerk/Documents/car_project/.git/
Rubis:) git add .
Rubis:) ggit commit -m "first_app"
-bash: ggit: command not found
Rubis:) git commit -m "first_app"
[master 975f585] first_app
36 files changed, 835 insertions(+)
create mode 100644 first_app/.gitignore
create mode 100644 first_app/Gemfile
create mode 100644 first_app/Gemfile.lock
create mode 100644 first_app/README.rdoc
create mode 100644 first_app/Rakefile
create mode 100644 first_app/app/assets/images/.keep
create mode 100644 first_app/app/assets/javascripts/application.js
create mode 100644 first_app/app/assets/stylesheets/application.css
create mode 100644 first_app/app/controllers/application_controller.rb
create mode 100644 first_app/app/controllers/concerns/.keep
create mode 100644 first_app/app/helpers/application_helper.rb
create mode 100644 first_app/app/mailers/.keep
create mode 100644 first_app/app/models/.keep
create mode 100644 first_app/app/models/concerns/.keep
create mode 100644 first_app/app/views/layouts/application.html.erb
create mode 100755 first_app/bin/bundle
create mode 100755 first_app/bin/rails
create mode 100755 first_app/bin/rake
create mode 100644 first_app/config.ru
create mode 100644 first_app/config/application.rb
create mode 100644 first_app/config/boot.rb
create mode 100644 first_app/config/database.yml
create mode 100644 first_app/config/environment.rb
create mode 100644 first_app/config/environments/development.rb
create mode 100644 first_app/config/environments/production.rb
create mode 100644 first_app/config/environments/test.rb
create mode 100644 first_app/config/initializers/backtrace_silencers.rb
create mode 100644 first_app/config/initializers/filter_parameter_logging.rb
create mode 100644 first_app/config/initializers/inflections.rb
create mode 100644 first_app/config/initializers/mime_types.rb
create mode 100644 first_app/config/initializers/secret_token.rb
create mode 100644 first_app/config/initializers/session_store.rb
create mode 100644 first_app/config/initializers/wrap_parameters.rb
create mode 100644 first_app/config/locales/en.yml
create mode 100644 first_app/config/routes.rb
create mode 100644 first_app/db/seeds.rb
create mode 100644 first_app/lib/assets/.keep
create mode 100644 first_app/lib/tasks/.keep
create mode 100644 first_app/log/.keep
create mode 100644 first_app/public/404.html
create mode 100644 first_app/public/422.html
create mode 100644 first_app/public/500.html
create mode 100644 first_app/public/favicon.ico
create mode 100644 first_app/public/robots.txt
create mode 100644 first_app/test/controllers/.keep
create mode 100644 first_app/test/fixtures/.keep
create mode 100644 first_app/test/helpers/.keep
create mode 100644 first_app/test/integration/.keep
create mode 100644 first_app/test/mailers/.keep
create mode 100644 first_app/test/models/.keep
create mode 100644 first_app/test/test_helper.rb
create mode 100644 first_app/vendor/assets/javascripts/.keep
create mode 100644 first_app/vendor/assets/stylesheets/.keep
Rubis:) git push
Counting objects: 32, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (25/25), done.
Writing objects: 100% (31/31), 8.95 KiB, done.
Total 31 (delta 1), reused 0 (delta 0)
To https://github.com/Sedclerk/car_project.git
7cc0b99..975f585  master -> master
Rubis:) git log
commit 975f5859028796feebe6e1f54d387d2f2ca2e1e6
Author: sedclerk <sedclerk@gmail.com>
Date:   Thu Jan 30 16:08:27 2014 +0300

first_app

commit 7cc0b995ee6af9bb3cd0755106850bb3a7ccf997
Author: sedclerk <sedclerk@gmail.com>
Date:   Tue Jan 28 17:04:01 2014 +0300

still working on it but take a look?

commit 608f02f28f58209417b5031cf0c954a0e734cc0c
Author: sedclerk <sedclerk@gmail.com>
Date:   Tue Jan 28 05:54:35 2014 +0300

updated project 20

commit e4d9f4c6944d1f7d491ac223dd6cb98ed4eddc7f
Author: sedclerk <sedclerk@gmail.com>
Date:   Mon Jan 27 17:15:21 2014 +0300

Starting project 21

commit 69dddbf45efb4072f3d4d3cc41deac664723f51c
Author: sedclerk <sedclerk@gmail.com>
Date:   Mon Jan 27 12:04:59 2014 +0300

Finished project 20

commit 6e1c71cab461b3b199333c15f980846187369397
Author: sedclerk <sedclerk@gmail.com>
Date:   Fri Jan 24 17:10:24 2014 +0300

kind of finishing project 20, and also let me know for any help ? Thanks

commit 36e134e2c9f9802e261355b407aa350914025f71
Author: sedclerk <sedclerk@gmail.com>
Date:   Thu Jan 23 17:57:33 2014 +0300

Finished updated 19

commit 5449c409fc0978a0811fefc39842e5074daf73f3
Author: sedclerk <sedclerk@gmail.com>
Date:   Thu Jan 23 16:28:21 2014 +0300

Finished Project 19

commit 78ab37f989b8b72b9a776eb48677bd6d611a8d89
Author: sedclerk <sedclerk@gmail.com>
Date:   Wed Jan 22 15:52:05 2014 +0300

Finished project 18

commit 470744dc6e7c5883c625e5eecc73b9ab99d7000a
Author: sedclerk <sedclerk@gmail.com>
Date:   Tue Jan 21 23:17:10 2014 +0300

updated 18

commit 61b0e07a8efba5b1caafdc60f854125f70f1aeeb
Author: sedclerk <sedclerk@gmail.com>
Date:   Tue Jan 21 19:09:32 2014 +0300

Updated 17

commit fe9539b6f7bbc807917ad0a2eda71aef109facc1
Author: sedclerk <sedclerk@gmail.com>
Date:   Fri Jan 17 11:24:31 2014 +0300

Project 18

commit fec51ec27100689a85ec3ce14381556c2f41b2a6
Author: Sedclerk <sedclerk@gmail.com>
Date:   Fri Jan 17 00:16:07 2014 -0800

Initial commit
(END)


here is my bundle installer

Rubis:) bundle install --without production
Using rake (10.1.1)
Using i18n (0.6.9)
Using minitest (4.7.5)
Using multi_json (1.8.4)
Using atomic (1.1.14)
Using thread_safe (0.1.3)
Using tzinfo (0.3.38)
Using activesupport (4.0.2)
Using builder (3.1.4)
Using erubis (2.7.0)
Using rack (1.5.2)
Using rack-test (0.6.2)
Using actionpack (4.0.2)
Using mime-types (1.25.1)
Using polyglot (0.3.3)
Using treetop (1.4.15)
Using mail (2.5.4)
Using actionmailer (4.0.2)
Using activemodel (4.0.2)
Using activerecord-deprecated_finders (1.0.3)
Using arel (4.0.1)
Using activerecord (4.0.2)
Using coffee-script-source (1.7.0)
Using execjs (2.0.2)
Using coffee-script (2.2.0)
Using thor (0.18.1)
Using railties (4.0.2)
Using coffee-rails (4.0.1)
Using hike (1.2.3)
Using jbuilder (1.5.3)
Using jquery-rails (3.1.0)
Using json (1.8.1)
Using mysql2 (0.3.15)
Using bundler (1.5.2)
Using tilt (1.4.1)
Using sprockets (2.10.1)
Using sprockets-rails (2.0.1)
Using rails (4.0.2)
Using rdoc (4.1.1)
Using sass (3.2.14)
Using sass-rails (4.0.1)
Using sdoc (0.4.0)
Using turbolinks (2.2.0)
Using uglifier (2.4.0)
Your bundle is complete!
Gems in the group production were not installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
Rubis:)

here is to set up heroku

Rubis:) git clone git://github.com/heroku/ruby-sample.git
Cloning into 'ruby-sample'...
remote: Reusing existing pack: 16, done.
remote: Total 16 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (16/16), done.
Resolving deltas: 100% (1/1), done.
Rubis:) cd ruby-sample
Rubis:) heroku create
Enter your Heroku credentials.
Email: sedclerk@gmail.com
Password (typing will be hidden):
Found existing public key: /Users/Sedclerk/.ssh/github_rsa.pub
Uploading SSH public key /Users/Sedclerk/.ssh/github_rsa.pub... done
Creating aqueous-savannah-2456... done, stack is cedar
http://aqueous-savannah-2456.herokuapp.com/ | git@heroku.com:aqueous-savannah-2456.git
Git remote heroku added
Rubis:)  git push heroku master
The authenticity of host 'heroku.com (50.19.85.132)' can't be established.
RSA key fingerprint is 8b:48:5e:67:0e:c9:16:47:32:f2:87:0c:1f:c8:60:ad.
Are you sure you want to continue connecting (yes/no)? y
Please type 'yes' or 'no': yes
Warning: Permanently added 'heroku.com,50.19.85.132' (RSA) to the list of known hosts.
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
Rubis:) cd /Users/Sedclerk/Documents/car_project/first_app
Rubis:) git clone git://github.com/heroku/first_app.git
Cloning into 'first_app'...
fatal: remote error:
Repository not found.
Rubis:) git clone git://github.com/heroku/ruby-sample.git
fatal: destination path 'ruby-sample' already exists and is not an empty directory.
Rubis:) cd /Users/Sedclerk/Documents/car_project/first_app
Rubis:) heroku create
Creating arcane-bastion-3033... done, stack is cedar
http://arcane-bastion-3033.herokuapp.com/ | git@heroku.com:arcane-bastion-3033.git
Git remote heroku added
Rubis:) git push heroku master
Warning: Permanently added the RSA host key for IP address '50.19.85.154' to the list of known hosts.
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
Rubis:) heroku open
Opening arcane-bastion-3033... done
Rubis:)




