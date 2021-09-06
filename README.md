# OKBloomer

### By Adrian Camacho, Kyle Kay-Perez, James Benjamin Pawlik, and Araceli Valdovinos

### Project Description

OKBloomer is a plant health tracking application with social media features. It allows a user to sign up, create pages for their plants, track plant health, and receive watering and care reminders. The app makes calls to an API that retrieves general information about the user's plants. There is a leaderboard for the users with the healthiest plants. The app has a messaging system for users to communicate with each other.
---
### Technologies Used
OKBloomer is written in Ruby on Rails. The database was created using PostgreSQL and seeded with the Faker gem. The app makes API calls to [Open Farm](http://openfarm.css). API calls were tested with Postman. The HTML-embedded Ruby pages were styled using Sass, SCSS, and Bootstrap. Graphs were generated using the Chartkick gem. Authorization and authentication are done through the ActiveAdmin and Devise gems. Pagination is achieve with the Kaminari gem. Testing is done with RSpec.
---
### Installation Instructions
1. If you do not have Ruby installed, follow the instructions at [Ruby](https://www.ruby-lang.org/en/)
2. Install PostgreSQL by following the instructions at [PostgreSQL](https://www.postgresql.org/download/)
3. Open a terminal in the destination directory and run 'gem install bundler'
4. Run 'postgres' to open an SQL server
5. Run 'git clone https://github.com/jbpawlik/OKBloomer'
6. Navigate to the top level of the directory and run 'bundle install' in your terminal to install dependencies
7. Run 'rake db:create' and then 'rake db:migrate' to create a database and migrate tables. The database can be reset by running 'rake db:reset' or re-seeded by running 'rake db:seed'. Seeding the database will create sample users, plants, and messages; login information can be found in db/seeds.rb. 
8. Run the site using the terminal command 'rails s' and navigate to localhost:3000. NOTE: it is possible that your machine assigned the server to another address; this can be checked by reading the terminal log generated after running 'rails s'.
9. Tests can be run with the 'rspec' terminal command

Alternately, visit the live deployment on [Heroku](http://okbloomer.herokuapp.com). You can sign up or use the test account (email: test@test.com, password: User2002!)
---
### Known Bugs
No bugs have been reported at this time. Please open a pull request if you run into performance issues.
---
### Contact Info

The authors can be reached at: <adriancamacho18@gmail.com>, <kyle.kayperez@gmail.com>, <james.benjamin.pawlik@gmail.com>, <valdovinosaraceli50@gmail.com>

### __License__
This software is licensed under the [BSD license](license.txt).

[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)

Copyright (c) 2021 Adrian Camacho, Kyle Kay-Perez, James Benjamin Pawlik, and Araceli Valdovinos

