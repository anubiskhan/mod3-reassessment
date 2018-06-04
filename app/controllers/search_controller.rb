class SearchController < ApplicationController
  def show
    @search = LocationDetail.new(params[:search])
  end
end
