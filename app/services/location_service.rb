class LocationService
  def initialize(location)
    @location = location
    @conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/")
  end

  def location_body
    locations?query=#{location}
    resp = @conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end

    JSON.parse(resp.env.body)
  end

  def response
    
  end
end
