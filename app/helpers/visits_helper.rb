module VisitsHelper

  def states
    %w(NC SC VA TN WV FL GA OH KY)
  end

  def visit_check
    if household.visits.count > 0

      @box = household.box_type
      @last = household.visits.last.visited_on
      @diff = Date.today - @last
      @text = 'Visited Recently'

      if @diff < 30 && household.box_type == 'One'
        @text
      elsif @diff < 14 && household.box_type == 'Two'
        @text
      end
    end
  end

end