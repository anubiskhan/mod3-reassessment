class LocationService
  def initialize(location)
    @location = location
    @conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/locations")
  end

  def location_body
    JSON.parse(response.env.body)
  end

  def response
    @conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
      conn.params['query'] = @location
    end
  end
end
