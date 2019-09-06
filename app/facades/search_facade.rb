class SearchFacade
  def initialize(house)
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

  private

  def house_members(house)
    service.members_by_house(house)
  end

  def service
    @_service ||= WesterosService.new
  end
end
