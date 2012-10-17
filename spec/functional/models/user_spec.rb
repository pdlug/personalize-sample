require File.expand_path('../../spec_helper', File.dirname(__FILE__))

describe User do
  describe 'properties' do
    let(:user) { User.new }

    %w(name username password email).each do |p|
      it "should have a property #{p}" do
        user.should respond_to(p.to_sym)
        user.should respond_to("#{p}=".to_sym)
      end
    end
  end

  describe 'validation' do
    describe 'username' do
      context 'when username is nil' do
        let(:user) { User.new }

        it 'should not be valid' do
          user.should_not be_valid
          user.errors[:username].should_not be_blank
        end
      end

      context 'when username is blank' do
        let(:user) { User.new }

        it 'should not be valid' do
          user.should_not be_valid
          user.errors[:username].should_not be_blank
        end
      end

      describe 'invalid usernames' do
        let(:user) { User.new }

        it 'should not be valid if username contains any non-lowercase alphanumeric characters' do
          [
            '  foo',
            'u$sername',
          ].each do |username|
            user.username = username
            user.should_not be_valid
            user.errors[:username].should_not be_blank
          end
        end
      end

      describe 'valid usernames' do
        let(:user) { User.new }

        it 'should valid if username consists of lowercase alphanumeric characters' do
          [
            'foo',
            'bar123',
          ].each do |username|
            user.username = username
            user.should_not be_valid
            user.errors[:username].should_not be_blank
          end
        end
      end
    end

    describe 'unique by username' do
      # TODO: implement this case
    end
  end
end
