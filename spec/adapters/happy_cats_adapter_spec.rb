require 'rails_helper'

describe HappyCatsAdapter do
  let(:shop_url) { 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml' }

  describe '.find' do
    subject { described_class.find(type: type, location: location) }

    context 'when there are matched cats' do
      let(:type)     { 'Bengal' }
      let(:location) { 'Kyiv' }
      let(:price)    {  600 }

      it 'returns array of cats' do
        expect(subject).to     be_instance_of Array
        expect(subject).not_to be_empty
      end

      it 'returns cat with the lowest price for requested params' do
        expect(subject.first.name).to      eq type
        expect(subject.first.location).to  eq location
        expect(subject.first.price).to     eq price
      end
    end

    context 'when there are no matched cats' do
      let(:type)     { 'IamUNIQstringNOTaCAT' }
      let(:location) { 'IamUNIQstringNOTaLOCATION' }

      it 'returns array with no cats' do
        expect(subject).to be_instance_of Array
        expect(subject).to be_empty
      end
    end
  end

  describe '.path' do
    subject { described_class.path }

    it 'returns adapter request path' do
      expect(subject).to eq(URI(shop_url).path)
    end
  end

  describe '.host' do
    subject { described_class.host }

    it 'returns adapter request host' do
      expect(subject).to eq(URI(shop_url).host)
    end
  end
end
