# encoding: utf-8

require File.expand_path('../../spec_helper', File.dirname(__FILE__))

describe Alert do
  describe 'properties' do
    let(:alert) { Alert.new }

    %w[category label].each do |p|
      it "has a property #{p}" do
        expect(alert).to respond_to(p.to_sym)
        expect(alert).to respond_to("#{p}=".to_sym)
      end
    end
  end
end
