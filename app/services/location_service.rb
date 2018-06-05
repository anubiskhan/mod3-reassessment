class LocationService
  def initialize(location)
    @conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/locations?query=#{location}")
  end

  def location_body
    resp = @conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end

    JSON.parse(resp.env.body)
  end
end
