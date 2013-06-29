class VisitPdf < Prawn::Document

  def initialize(household)
    super()
    @household = household
    @id = @household.id
    @visit = household.visits[0]
    visit_date
    household_name
    house_count
    starch
    special
  end

  def household_name
    move_down 10
    text "Household: #{@household.name}"
  end

  def house_count
    text "Neighbors: #{@household.neighbors.count}"
  end


   def visit_date
     text "Date: #{@visit.visited_on.strftime('%B %d, %Y')}"
   end

  # def visit_id
  #    move_down 20
  #    text "Visit #: #{@household.visit.id}"
  #  end

   def starch
     move_down 10
     text 'Food Order'
     text "#{@visit.starch}"
     text "#{@visit.cereal}"
     text "#{@visit.option1}"
   end

  def special
    move_down 5
    text 'Special Needs'
    text "#{@household.food_alert}"
    text "#{@visit.items_received}"
  end

end