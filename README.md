# Personalize - A Sample Application

This is the rough skeleton of a web application that allows users to
create an account and sign up for alerts (email, RSS, Twitter, etc.).
The instructions below cover the basics of what is there and the TODO
file provides ideas for next steps.

## Requirements

* Ruby
* [Bundler](http://gembundler.com/)
* [MongoDB](http://www.mongodb.org/) - must be running on your local host (downloading a package and starting via ./bin/mongod is sufficient).

## Getting Started

    bundle install --path vendor
    bundle exec rackup

This will start the application running which can then be accessed at: http://localhost:9292/

The default rake task will run all of the specs:

    bundle exec rake

## Project Structure

    config/    - configuration files
    lib/
      models/  - Mongoid models
      personalize_server.rb - sinatra web application
    public/ - static assets
    spec/
      functional/  - functional specs
      request/     - request specs using rack-test
    views/ - templates and layouts for webapp views

## Data Model & Persistence

The persistence uses the object document mapper (ODM) Mongoid with two
basic models provided by the skeleton.

* *User* - a user that signs up for the system, logs in, and is able to
subscribe to individual alerts
* *Alert* - an alert provided by the system for a topic or source, users
are able to sign up to receive as many individual alerts as provided by
the system

## Technologies used
* [Sinatra](http://sinatrarb.com/)
* [Mongoid](http://mongoid.org/)
* [rspec](https://www.relishapp.com/rspec)
* [randexp](https://github.com/benburkert/randexp)
