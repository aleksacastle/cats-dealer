require 'rails_helper'

describe CatsFinder do
  let(:type)        { 'dummy_type' }
  let(:location)    { 'dummy_location' }
  let(:cat_finder)  { described_class.call(type: type, location: location) }

  describe '.call' do
    it 'calls find on new instance of CatsFinder' do
      expect_any_instance_of(CatsFinder).to receive(:find)
      cat_finder
    end
  end

  describe '#find' do
    context 'when no match' do
      it 'returns empty array if no match' do
        expect(cat_finder).to eq []
      end
    end

    context 'when has match' do
      let(:type)     { 'Abyssin' }
      let(:location) { 'Lviv' }

      it 'returns array' do
        expect(cat_finder).to be_instance_of Array
      end

      it 'returns array with cats that matched' do
        expect(cat_finder.first.name).to eq 'Abyssin'
        expect(cat_finder.first.location).to eq 'Lviv'
      end
    end
  end
end
