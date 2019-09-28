require 'rails_helper'

describe ::Cats::ShowFacade do
  subject { described_class.new(type: type, location: location) }

  context 'when no match' do
    let(:type)     { 'IamUNIQstringNOTaCAT' }
    let(:location) { 'IamUNIQstringNOTaLOCATION' }

    describe '#cats' do
      it 'returns empty array' do
        expect(subject.cats).to be_empty
      end
    end

    describe '#best_price' do
      it 'returns nil' do
        expect(subject.best_price).to be_nil
      end
    end

    describe '#cats_found?' do
      it 'returns false' do
        expect(subject.cats_found?).to be_falsey
      end
    end

    describe '#not_found_error' do
      let(:error_text) { 'Sorry, no cats for your location' }

      it 'returns error text' do
        expect(subject.not_found_error).to eq(error_text)
      end
    end
  end

  context 'when has match' do
    let(:type)     { 'Abyssin' }
    let(:location) { 'Lviv' }
    let(:price)    { 500 }

    describe '#cats' do
      it 'returns array of cats' do
        expect(subject.cats).to     be_instance_of Array
        expect(subject.cats).not_to be_empty
      end
    end

    describe '#best_price' do
      it 'returns price' do
        expect(subject.best_price).to eq price
      end
    end

    describe '#cats_found?' do
      it 'returns true' do
        expect(subject.cats_found?).to be_truthy
      end
    end

    describe '#not_found_error' do
      let(:error_text) { 'Sorry, no cats for your location' }

      it 'returns nil' do
        expect(subject.not_found_error).to     be_nil
        expect(subject.not_found_error).not_to eq(error_text)
      end
    end
  end
end
