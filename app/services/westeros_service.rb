class WesterosService
  def members_by_house(house)
    get_json("/api/v1/house/#{house}?api_key=#{ENV['WESTEROS_API']}")
  end

  private

  def conn
    Faraday.new(url: "http://westerosapi.herokuapp.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
