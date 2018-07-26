require 'rails_helper'

describe Cuisine do
  it 'initializes properly' do
    detail_hash = {
        "popularity" => "4.57",
        "nightlife_index" => "4.56",
        "nearby_res" => [
            "16971985",
            "16968020",
            "16972830",
            "16971274",
            "16975729",
            "16969942",
            "16973157",
            "16967185",
            "16974574"
        ],
        "top_cuisines" => [
            "American",
            "Sandwich",
            "Cafe",
            "Pizza",
            "Bar Food"
        ]}
    cuisine = Cuisine.new(detail_hash['top_cuisines'][0])

    expect(cuisine.name).to eq('American')
  end
end
