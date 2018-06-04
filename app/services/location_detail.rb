class LocationDetail
  def initialize(location)
    @location = location
    location_details_lookup
  end

  def location_details_lookup
    location_info = Location.new(@location)
    binding.pry
    conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/location_details?entity_id=#{location_id}&entity_type=#{location_type}")

    resp = conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end
  end
end
