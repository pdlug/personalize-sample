require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default, ENV['RACK_ENV'].to_sym)

$LOAD_PATH.unshift File.expand_path('./lib', File.dirname(__FILE__))
require 'personalize_server'

use Rack::Lint

run PersonalizeServer.new
