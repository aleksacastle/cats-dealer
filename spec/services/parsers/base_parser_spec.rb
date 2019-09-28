require 'rails_helper'

describe Parsers::BaseParser do
  it 'raises an exception for #parse' do
    expect { described_class.parse }.to raise_error NotImplementedError
  end
end
