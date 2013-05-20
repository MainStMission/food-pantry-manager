module Harvest_helper

  def household_status_for(@household = household)
    presenter = Harvest_helper.new

    if block_given?
      yield presenter
    else

    end
  end
end