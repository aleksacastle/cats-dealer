require 'rails_helper'

describe Parsers::JsonParser do
  let(:payload) { Net::HTTP.get(CatsUnlimitedAdapter.host, CatsUnlimitedAdapter.path) }
  let(:result) { described_class.parse(payload) }
  let(:first_record) { result.first }

  it { expect(described_class).to be < Parsers::BaseParser }

  it 'parses json to hash' do
    expect(first_record.class).to be Hash
  end

  it 'parses with expected keys' do
    expect(first_record.keys).to eq %w[name price location image]
  end
end
