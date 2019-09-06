class WesterosService
  def members_by_house(house)
    get_json("/api/v1/house/#{house}?api_key=#{ENV[WESTEROS_API]}")
  end
end
