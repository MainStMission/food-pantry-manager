module HarvestHelper

  def household_status_for(household = @household)
    presenter = Harvest.new

    if block_given?
      yield presenter
    else

    end
  end

  def month_select
    %w(January February March April May June July August September October November December )
  end

  def household_neighbor_count(houses)
    houses.each  do |id| 
     Household.find(id).neighbor_count
    end
  end

  def initialize_month
    @month = ' '
  end


end
