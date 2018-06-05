require 'rails_helper'

describe LocationDetailPresenter do
  describe 'methods' do
    it '#top_cuisines' do
      loc_det_pre = LocationDetailPresenter.new('city', 305)
      expected = %w[American Sandwich Cafe Pizza Bar\ Food]

      expect(loc_det_pre.top_cuisines).to eq(expected)
    end
    it '#top_5_restaurants' do
      loc_det_pre = LocationDetailPresenter.new('city', 305)

      expect(loc_det_pre.top_5_restaurants).to be_instance_of(Array)
      expect(loc_det_pre.top_5_restaurants[0]).to be_instance_of(Restaurant)
      expect(loc_det_pre.top_5_restaurants[0].name).to eq('Snooze')
    end
    it '#restaurantify' do
      restaurant = Restaurant.new('Zorba', '1234 Fake Street, Kansas, MI 12345', 'Far away')

      expect(restaurant.name).to eq('Zorba')
      expect(restaurant.address).to eq('1234 Fake Street, Kansas, MI 12345')
      expect(restaurant.locality).to eq('Far away')
    end
  end
end
