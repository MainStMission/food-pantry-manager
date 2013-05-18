module HouseholdsHelper

  def visits_by_date
    if household.visits.count > 0
      household.visits.group_by(&:visited_on)
    end
  end

end
