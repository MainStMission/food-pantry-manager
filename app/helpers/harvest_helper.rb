module HarvestHelper

  def household_status_for(household = @household)
    presenter = Harvest.new

    if block_given?
      yield presenter
    else

    end
  end

  def neighbor_count(h_month)
    h_month.each  do |household_id|
      Household.search(params[household_id]).neighbor_count.sum
    end
  end


  def month_select
    %w(January February March April May June July August September October November December )
  end

  def initialize_month
    @month = ' '
  end


end
