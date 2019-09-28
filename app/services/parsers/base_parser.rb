module Parsers
  class BaseParser
    include MandatoryMethods

    mandatory_class_methods :parse
  end
end
