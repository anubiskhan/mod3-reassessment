require 'rails_helper'

describe SearchPresenter do
  describe 'methods' do
    it '#top_cuisines' do
      search = SearchPresenter.new('Denver')

      expect(search.top_cuisines).to be_instance_of(Array)
      expect(search.top_cuisines[0]).to be_instance_of(Cuisine)
      expect(search.top_cuisines[0].name).to eq('American')
    end
    it '#top_5_restaurants' do
      search = SearchPresenter.new('Denver')

      expect(search.top_5_restaurants).to be_instance_of(Array)
      expect(search.top_5_restaurants[0]).to be_instance_of(Restaurant)
      expect(search.top_5_restaurants[0].name).to eq('Snooze')
    end
  end
end
