require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default, ENV['RACK_ENV'].to_sym)

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require File.join(File.dirname(__FILE__), 'lib', 'personalize_server')

use Rack::Lint
#use Rack::Static, urls: ["/css", "/img", "/js"], root: "public"

run PersonalizeServer.new
