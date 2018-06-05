class SearchController < ApplicationController
  def show
    location_lookup = LocationPresenter.new(params[:search])
    @search = LocationDetailPresenter.new(location_lookup.entity_type, location_lookup.entity_id)
  end
end
