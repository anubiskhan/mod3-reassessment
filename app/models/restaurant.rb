class Restaurant
  attr_reader :name, :address, :locality
  def initialize(restaurant_hash)
    @name = restaurant_hash['restaurant']['name']
    @address = restaurant_hash['restaurant']['location']['address']
    @locality = restaurant_hash['restaurant']['location']['locality']
  end
end
