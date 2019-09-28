require 'rails_helper'

describe 'External request feature' do
  let(:json_link) { CatsUnlimitedAdapter::REQUEST_URL }
  let(:xml_link)  { HappyCatsAdapter::REQUEST_URL }

  it 'queries external resouces' do
    uri = URI(json_link)

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
