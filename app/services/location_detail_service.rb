class LocationDetailService
  def initialize(type, id)
    @conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/location_details?entity_id=#{id}&entity_type=#{type}")
  end

  def location_detail_body
    resp = @conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end

    JSON.parse(resp.body)
  end
end
