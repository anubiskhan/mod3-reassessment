class LocationDetail
  attr_reader :location_details_body
  def initialize(location)
    @location = location
    location_details_lookup
  end

  def location_details_lookup
    location_info = Location.new(@location)
    location_type = location_info.location_body['location_suggestions'][0]['entity_type']
    location_id   = location_info.location_body['location_suggestions'][0]['entity_id']
    conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/location_details?entity_id=#{location_id}&entity_type=#{location_type}")

    resp = conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end

    @location_details_body = JSON.parse(resp.body)
  end
end
