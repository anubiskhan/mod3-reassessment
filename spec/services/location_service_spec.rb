require 'rails_helper'

describe LocationService do
  describe '#location_body' do
    it 'returns the expected data' do
      location_service = LocationService.new('Denver')
      location_body = location_service.location_body

      expected = ["location_suggestions", "status", "has_more", "has_total"]

      expect(location_body.keys).to eq(expected)
    end
  end
end
