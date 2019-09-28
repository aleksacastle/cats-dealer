require 'sinatra/base'

class FakeShop < Sinatra::Base
  get CatsUnlimitedAdapter.path, host_name: CatsUnlimitedAdapter.host do
    json_response(200, 'test.json')
  end

  get HappyCatsAdapter.path, host_name: HappyCatsAdapter.host do
    xml_response(200, 'test.xml')
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

  def xml_response(response_code, file_name)
    content_type :xml
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
