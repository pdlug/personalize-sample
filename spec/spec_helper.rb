# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :test)

require 'randexp'
require 'rspec/core'

require 'rack/test'
Sinatra::Application.environment = :test
ENV['RACK_ENV'] = 'test'

require File.expand_path('../lib/personalize_server', File.dirname(__FILE__))

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def app
    PersonalizeServer.new
  end
end
