class SearchController < ApplicationController
  def show
    binding.pry
    @search = LocationDetail.new(params[:search])
  end
end
