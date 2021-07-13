# Github with Ruby on Rails

This project is a basic attempt to get repositories of github using with Github Api.

## Requirements
* Ruby version -- `2.7.2`
* Configuration  -- Postgres must be installed

## Installation
* RUN `gem install bundler:2.1.4 && bundle install`
* RUN `cp config/database.example.yml config/database.yml`
* Add database config in `config/database.yml`
* Database creation - `rake db:create`
* Database initialisation - `rake db:migrate`
* Launch `rails s`
