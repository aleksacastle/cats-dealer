module Parsers
  class BaseParser
    def self.parse(_)
      raise NotImplementedError, 'Subclasses must define `self.parse`.'
    end
  end
end
