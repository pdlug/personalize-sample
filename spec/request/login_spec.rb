require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe 'POST /login' do
  context 'given an invalid username/password' do
    before do
      post '/login', username: /\w{8}/.gen, password: /\w{10}/.gen
    end

    it 'should return 401 unauthorized' do
      last_response.status.should == 401
    end
  end

  context 'given an only a username' do
    let(:user) { User.create(username: /\w{8}/.gen, password: /\w{10}/.gen) }
    before do
      post '/login', username: user.username
    end

    it 'should return 401 unauthorized' do
      last_response.status.should == 401
    end
  end

  context 'given a valid username/password' do
    let(:user) { User.create(username: /\w{8}/.gen, password: /\w{10}/.gen) }

    before do
      post '/login', username: user.username, password: user.password
    end

    it 'should be successful' do
      last_response.should be_successful
    end

    it 'should display a welcome page' do
      last_response.body.should match(/Welcome/)
    end
  end
end
