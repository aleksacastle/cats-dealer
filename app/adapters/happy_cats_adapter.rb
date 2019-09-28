class HappyCatsAdapter < BaseAdapter
  REQUEST_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml'.freeze

  private

  def cats_payload
    @cats_payload ||= response_payload.map do |cat|
      cat(name: cat[:title], price: cat[:cost].to_i, location: cat[:location], image: cat[:img])
    end
  end

  def parser_class
    ::Parsers::XmlParser
  end
end
