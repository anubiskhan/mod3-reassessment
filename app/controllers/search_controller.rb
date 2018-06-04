class SearchController < ApplicationController
  def show
    search = LocationDetail.new(params[:search])
    @top_cuisines = search.location_details_body['top_cuisines']
    @top_5_restaurants = search.location_details_body['best_rated_restaurant'][0..4]
    binding.pry
  end
end
@top_5_restaurants[0]["restaurant"]['name']
@top_5_restaurants[0]["restaurant"]['location']['address']
@top_5_restaurants[0]["restaurant"]['location']['locality']
