require 'rails_helper'

describe Parsers::XmlParser do
  let(:filename) { Rails.root.join('spec/support/helper_files', 'test.xml') }
  let(:file) { File.open(filename) }
  let(:payload) { file.read }
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
