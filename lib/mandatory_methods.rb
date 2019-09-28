module MandatoryMethods
  extend ActiveSupport::Concern

  class_methods do
    def mandatory_methods(*names)
      names.each do |name|
        define_method(name) { raise NotImplementedError, "Method `#{name}` has to be implemented!" }
      end
    end

    def mandatory_class_methods(*names)
      names.each do |name|
        define_singleton_method(name) { raise NotImplementedError, "Class method `#{name}` has to be implemented!" }
      end
    end
  end
end
