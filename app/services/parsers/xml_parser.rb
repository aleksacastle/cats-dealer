require 'ox'

module Parsers
  class XmlParser < BaseParser
    def self.parse(response)
      result = Ox.load(response, mode: :hash_no_attrs)

      result.dig(:cats, :cat)
    end
  end
end
