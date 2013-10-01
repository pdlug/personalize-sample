# encoding: utf-8
require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe 'POST /login' do
  context 'given an invalid username/password' do
    before do
      post '/login', username: /\w{8}/.gen, password: /\w{10}/.gen
    end

    it 'responds with 401 Unauthorized' do
      expect(last_response.status).to eq(401)
    end
  end

  context 'given an only a username' do
    let(:user) { User.create(username: /\w{8}/.gen, password: /\w{10}/.gen) }
    before do
      post '/login', username: user.username
    end

    it 'responds with 401 Unauthorized' do
      expect(last_response.status).to eq(401)
    end
  end

  context 'given a valid username/password' do
    let(:user) { User.create(username: /\w{8}/.gen, password: /\w{10}/.gen) }

    before do
      post '/login', username: user.username, password: user.password
    end

    it 'responds with 200 OK' do
      expect(last_response).to be_ok
    end

    it 'displays a welcome page' do
      expect(last_response.body).to match(/Welcome/)
    end
  end
end
