module HouseholdsHelper

  def visits_by_date
    if household.visits.count > 0
      household.visits.group_by(&:visited_on)
    end
  end



  def visit_check
    if household.visits.count > 0

      @box = household.box_type
      @last = household.visits.last.visited_on
      @diff = Date.today - @last
      @text = 'Warning, too many visits'

      if @diff < 30 && household.box_type == 'One'
        @text
      elsif @diff < 14 && household.box_type == 'Two'
        @text
      end
    end
  end

end
