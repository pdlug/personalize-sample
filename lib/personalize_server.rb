# encoding: utf-8

require 'erb'
require 'haml'
require 'mongoid'
require 'sinatra'

require_relative 'models/alert'
require_relative 'models/user'

class PersonalizeServer < Sinatra::Base
  set :raise_errors, true
  set :show_exceptions, true
  set :dump_errors, true

  set :static, true
  set :root, File.expand_path('..', File.dirname(__FILE__))

  configure do
    Mongoid.load!(File.join(root, 'config', 'mongoid.yml'),
                  Sinatra::Application.environment)

    # Bootstrap our basic alerts if this is a fresh DB
    if Alert.count == 0
      Alert.create(category: 'business', label: 'Business News')
      Alert.create(category: 'technology', label: 'Technology News')
      Alert.create(category: 'travel', label: 'Travel News')
    end
  end

  get '/' do
    haml :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      haml :welcome
    else
      halt 401
    end
  end
end
