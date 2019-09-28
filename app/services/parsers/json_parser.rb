module Parsers
  class JsonParser < BaseParser
    def self.parse(body)
      JSON.parse(body)
    end
  end
end
