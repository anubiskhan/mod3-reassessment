class SearchPresenter
  def initialize(city)
    location = LocationHandlerService.new(city)
    type = location.entity_type
    id = location.entity_id
    @location_detail_service = LocationDetailService.new(type, id)
  end

  def top_cuisines
    @location_detail_service.location_detail_body['top_cuisines']
  end

  def top_5_restaurants
    @location_detail_service.location_detail_body['best_rated_restaurant'][0..4].map do |r|
      restaurantify(r)
    end
  end

  private

  def restaurantify(restaurant_hash)
    Restaurant.new(restaurant_hash)
  end
end
