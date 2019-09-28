class CatsUnlimitedAdapter < BaseAdapter
  REQUEST_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json'.freeze

  private

  def cats_payload
    @cats_payload ||= response_payload.map do |cat|
      cat(name: cat['name'], price: cat['price'].to_i, location: cat['location'], image: cat['image'])
    end
  end

  def parser_class
    ::Parsers::JsonParser
  end
end
