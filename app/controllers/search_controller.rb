class SearchController < ApplicationController
  def show
    @search = SearchPresenter.new(params[:search])
  end
end
