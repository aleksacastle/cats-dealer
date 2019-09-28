class HappyCatsAdapter < BaseAdapter
  REQUEST_URL = 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml'.freeze

  def process_payload
    return if cats_payload.empty?

    matched_cats = cats_payload.select { |cat| matched?(cat) }
    lowest_price = matched_cats.map { |cat| cat.price }.min
    matched_cats.select { |cat| cat.price == lowest_price  }
  end

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
