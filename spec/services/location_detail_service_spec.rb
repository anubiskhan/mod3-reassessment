require 'rails_helper'

describe LocationDetailService do
  describe '#location_detail_body' do
    it 'returns the expected data' do
      location_detail_service = LocationDetailService.new('city', 305)
      location_detail_body = location_detail_service.location_detail_body

      expected = ["popularity", "nightlife_index", "nearby_res", "top_cuisines", "popularity_res", "nightlife_res", "subzone", "subzone_id", "city", "location", "num_restaurant", "best_rated_restaurant"]

      expect(location_detail_body.keys).to eq(expected)
    end
  end
end
