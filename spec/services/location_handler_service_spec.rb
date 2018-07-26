require 'rails_helper'

describe LocationHandlerService do
  describe 'methods' do
    it '#entity_type' do
      loc_pre = LocationHandlerService.new('Denver')

      expect(loc_pre.entity_type).to eq('city')
    end
    it '#entity_id' do
      loc_pre = LocationHandlerService.new('Denver')

      expect(loc_pre.entity_id).to eq(305)
    end
  end
end
