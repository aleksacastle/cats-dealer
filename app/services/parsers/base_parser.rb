module Parsers
  class BaseParser
    include MandatoryMethods

    mandatory_methods :parse
  end
end
