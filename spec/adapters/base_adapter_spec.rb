require 'rails_helper'

describe BaseAdapter do
  describe '.find' do
    let(:type)     { 'dummy_type' }
    let(:location) { 'dummy_location' }

    %i[parser_class cats_payload].each do |method|
      it "raises #{method} not implemented error" do
        expect { described_class.find(type: type, location: location) }.to raise_error NotImplementedError
      end
    end
  end
end
