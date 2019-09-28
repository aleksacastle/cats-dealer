class CatsFinder
  attr_reader :type, :location

  def initialize(type:, location:)
    @type     = type
    @location = location
  end

  def self.call(type:, location:)
    new(type: type, location: location).find
  end

  def find
    lowest_price = found_cats.map(&:price).min
    found_cats.select { |cat| cat.price == lowest_price }
  end

  private

  def found_cats
    @found_cats ||= cat_shops.map { |shop| shop.find(type: type, location: location) }.flatten
  end

  def cat_shops
    [
      CatsUnlimitedAdapter,
      HappyCatsAdapter
    ]
  end
end
