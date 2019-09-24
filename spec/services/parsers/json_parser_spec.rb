require 'rails_helper'

describe Parsers::JsonParser do
  let(:filename) { Rails.root.join('spec/support/helper_files', 'test.json') }
  let(:file) { File.open(filename) }
  let(:payload) { file.read }
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
