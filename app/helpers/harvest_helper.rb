module HarvestHelper

  def household_status_for(household = @household)
    presenter = Harvest.new

    if block_given?
      yield presenter
    else

    end
  end
end
