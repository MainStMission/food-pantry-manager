class Dashboard

   def initializer(households)
     @households = Houshold.find(:all)
   end


  def household_summary
    @household_count = Household.all.count
  {
      household_count: @household_count
  }

end

def visit_summary
	@visit_count = Visit.all.count
	@month = "#{Date.today.strftime('%B')}"
	@prev_month = "#{Date.today.prev_month.strftime('%B')}"
	@distinct_visits_this_month = Visit.by_month(@month).select("DISTINCT(household_id)").count

	@distinct_visits_last_month = Visit.by_month(@prev_month).select("DISTINCT(household_id)").count

  {
      visit_count: @visit_count, this_month: @month, current_visits: @distinct_visits_this_month,
        prev_month: @prev_month, last_month_visits: @distinct_visits_last_month,

        }
	
end

def neighbor_summary
	@neighbor_count = Neighbor.all.count

  {
       neighbor_count: @neighbor_count
  }
	
end

def donor_summary

	
end

def donation_summary
	
end

def volunteer_summary
	volunteer_count = Volunteers.count
end


attr_reader :households



end
