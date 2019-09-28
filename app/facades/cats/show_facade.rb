module Cats
  class ShowFacade
    def initialize(type:, location:)
      @type     = type
      @location = location
    end

    def cats
      found_cats
    end

    def best_price
      found_cats.first.price if cats_found?
    end

    def cats_found?
      !found_cats.empty?
    end

    def not_found_error
      'Sorry, no cats for your location' unless cats_found?
    end

    private

    attr_reader :type, :location

    def found_cats
      @found_cats ||= CatsFinder.call(type: type, location: location)
    end
  end
end
