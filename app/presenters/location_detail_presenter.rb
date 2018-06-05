class LocationDetailPresenter
  def initialize(type, id)
    @location_detail_service = LocationDetailService.new(type, id)
  end

  def top_cuisines
    @location_detail_service.location_detail_body['top_cuisines']
  end

  def top_5_restaurants
    @location_detail_service.location_detail_body['best_rated_restaurant'][0..4].map do |r|
      name = r['restaurant']['name']
      address = r['restaurant']['location']['address']
      locality = r['restaurant']['location']['locality']
      restaurantify(name, address, locality)
    end
  end

  def restaurantify(name, address, locality)
    Restaurant.new(name, address, locality)
  end
end
