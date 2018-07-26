class LocationDetailService
  def initialize(type, id)
    @type = type
    @id = id
    @conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/location_details")
  end

  def location_detail_body
    JSON.parse(response.body)
  end

  def response
    @conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
      conn.params['entity_type'] = @type
      conn.params['entity_id'] = @id
    end
  end
end
