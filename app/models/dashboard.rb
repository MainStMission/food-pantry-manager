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
	visit_count = Visits.count
	@month = "#{Date.today.strftime('%B')}"
	@prev_month = "#{Date.today.prev_month.strftime('%B')}"
	distinct_visits_this_month = Visits.by_month(@month).select("DISTINCT(household_id)").count
	distinct_visits_last_month = Visits.by_month(@prev_month).select("DISTINCT(household_id)").count
	
end

def neighbor_summary
	neighbor_count = Neighbors.count
	
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
