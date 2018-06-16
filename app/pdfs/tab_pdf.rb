
class TabPdf < Prawn::Document

  def initialize(visit)
    @visit = visit
    super(page_layout:  :portrait)
    visit_date
    household_name
    house_count
    special
  end

  def logo_image
    image "#{Rails.root}/app/assets/images/marketplace.png"
  end

  def household_name
    move_down 10
    text "Household: #{@visit.show_household}"
    text "Receipt"
  end

  def house_count
    text "Neighbors: #{@visit.household.neighbors.count}"
  end


   def visit_date
     text "ID: #{@visit.id.to_s}"
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
    text "#{@visit.household.food_alert}"
    text "#{@visit.items_received}"
  end
  
end