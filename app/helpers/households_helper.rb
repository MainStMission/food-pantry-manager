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
      @text = "#{@last.strftime('%A, %b %d')} exceeds #{household.box_type} visit per month"

      if @diff < 30 && household.box_type == 'One'
        @text
      elsif @diff < 14 && household.box_type == 'Two'
        @text
      end
    end
  end

end
