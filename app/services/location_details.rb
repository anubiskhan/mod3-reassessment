class LocationDetail
  def initialize(location)
    @location = location
    location_details_lookup
  end

  def location_details_lookup
    binding.pry
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{@word}"
    @resp = conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end
  end
end
