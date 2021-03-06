# encoding: utf-8

require File.expand_path('../../spec_helper', File.dirname(__FILE__))

describe User do
  describe 'properties' do
    let(:user) { User.new }

    %w[name username password email].each do |p|
      it "has a property #{p}" do
        expect(user).to respond_to(p.to_sym)
        expect(user).to respond_to("#{p}=".to_sym)
      end
    end
  end

  describe 'validation' do
    describe 'username' do
      context 'when username is nil' do
        let(:user) { User.new }

        it 'is not valid' do
          expect(user).not_to be_valid
          expect(user.errors[:username]).not_to be_blank
        end
      end

      context 'when username is blank' do
        let(:user) { User.new }

        it 'is not valid' do
          expect(user).not_to be_valid
          expect(user.errors[:username]).not_to be_blank
        end
      end

      describe 'invalid usernames' do
        let(:user) { User.new }

        it 'is not valid if username contains any non-lowercase alphanum '\
           'characters' do
          [
            '  foo',
            'u$sername'
          ].each do |username|
            user.username = username
            expect(user).not_to be_valid
            expect(user.errors[:username]).not_to be_blank
          end
        end
      end

      describe 'valid usernames' do
        let(:user) { User.new }

        it 'is valid if username consists of lowercase alphanum characters' do
          %w[
            foo
            bar123
          ].each do |username|
            user.username = username
            expect(user).to be_valid
            expect(user.errors[:username]).to be_blank
          end
        end
      end
    end

    describe 'unique by username' do
      # TODO: implement this case
    end
  end
end
