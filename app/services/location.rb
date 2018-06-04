class Location
  def initialize(location)
    @location = location
    location_lookup
  end

  def location_lookup
    conn = Faraday.new(url: "https://developers.zomato.com/api/v2.1/locations?query=#{@location}")
    resp = conn.get do |conn|
      conn.headers['user-key'] = ENV['API_KEY']
    end

    return JSON.parse(resp.env.body)
  end
end
