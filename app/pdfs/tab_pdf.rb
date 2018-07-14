
class TabPdf < Prawn::Document

  def initialize(visit)
    super()
    @visit = visit
    logo_image
    visit_date
    household_name
    visit_weight
  end

  def logo_image
    image "#{Rails.root}/app/assets/images/marketplace.png"
  end

  def household_name
    move_down 10
    text "Household: #{@visit.show_household}"
    text "Receipt"
  end

   def visit_date
     text "ID: #{@visit.id.to_s}"
     text "Date: #{@visit.visited_on.strftime('%B %d, %Y')}"
   end

   def visit_weight
    text "Weight: #{@visit.weight}"
    text "Tabs Spent: #{@visit.tab}"
   end

end