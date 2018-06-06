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
      rest_hash =
        {
          "restaurant" => {
              "R" => {
                  "res_id" => 16971985
              },
              "apikey" => "71efa1dce2d712733d64615e35982643",
              "id" => "16971985",
              "name" => "Zorba",
              "url" => "https://www.zomato.com/denver/steubens-food-service-north-capitol-hill?utm_source=api_basic_user&utm_medium=api&utm_campaign=v2.1",
              "location" => {
                  "address" => "1234 Fake Street, Kansas, MI 12345",
                  "locality" => "Far away",
                  "city" => "Denver",
                  "city_id" => 305,
                  "latitude" => "39.7433166667",
                  "longitude" => "-104.9804694444",
                  "zipcode" => "80203",
                  "country_id" => 216,
                  "locality_verbose" => "North Capitol Hill, Denver"
              }
            }
          }
      restaurant = Restaurant.new(rest_hash)

      expect(restaurant.name).to eq('Zorba')
      expect(restaurant.address).to eq('1234 Fake Street, Kansas, MI 12345')
      expect(restaurant.locality).to eq('Far away')
    end
  end
end
