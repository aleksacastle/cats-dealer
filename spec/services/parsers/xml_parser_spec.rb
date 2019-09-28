require 'rails_helper'

describe Parsers::XmlParser do
  let(:payload) { Net::HTTP.get(HappyCatsAdapter.host, HappyCatsAdapter.path) }
  let(:result) { described_class.parse(payload) }
  let(:first_record) { result.first }

  it { expect(described_class).to be < Parsers::BaseParser }

  it 'parses xml to hash' do
    expect(first_record.class).to be Hash
  end

  it 'parses with expected keys' do
    expect(first_record.keys).to eq %i[title cost location img]
  end
end
