class BaseAdapter
  include MandatoryMethods

  def initialize(type:, location:)
    @type     = type
    @location = location
  end

  def self.find(type:, location:)
    new(type: type, location: location).process_payload
  end

  def self.host
    URI(self::REQUEST_URL).host
  end

  def self.path
    URI(self::REQUEST_URL).path
  end

  private

  mandatory_methods :parser_class, :request_url, :process_payload

  attr_reader :type, :location

  def cat(name:, price:, location:, image:)
    Struct.new(:name, :price, :location, :image).new(name, price, location, image)
  end

  def matched?(cat)
    cat.name == type && cat.location == location
  end

  def cats_payload
    @cats_payload ||= parser_class.parse(request_response.body)
  end

  def request_response
    Faraday.get(self.class::REQUEST_URL)
  end
end
