class SearchFacade
  def initialize(house = nil)
    @house = house
  end

  def member_count
    "#{members.count} Members"
  end

  def members
    house_members(@house).map do |member|
      Member.new(member)
    end
  end

  def houses
    houses = []
    westeros_houses.map do |house|
      houses << [house[:name], house[:id]]
    end
    houses
  end

  private

  def westeros_houses
    service.all_houses
  end

  def house_members(house)
    service.members_by_house(house)[:data].first[:attributes][:members]
  end

  def service
    @_service ||= WesterosService.new
  end
end
