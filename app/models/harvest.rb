  class Harvest


  def initializer(houeshold)
    @household = household
  end

  def visit_count
    household_visits.count
  end

  def neighbor_count
    household_neighbors.count
  end


private

  def household_neighbors
    @household.neighbors
  end

  def household_visits
    @household.visits
  end

end