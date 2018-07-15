
class TabPdf < Prawn::Document

  def initialize(visit)
    super()
    @visit = visit
    logo_image
    household_name
    visit_date
    visit_weight
    token_summary
    hours
    table
  end

  def logo_image
    image "#{Rails.root}/app/assets/images/marketplace.png"
  end

  def household_name
    move_down 15
    text "Household: #{@visit.show_household}"
    move_down 20
  end

  def store_hours

  end

   def visit_date
     text " Thank You #{@visit.neighbor.first_name} for visiting Main Street Marketplace today"
     move_down 15
     text "Your visit Number is #{@visit.id.to_s} and you visited on #{@visit.visited_on.strftime('%B %d, %Y')}"
   end

   def visit_weight
    text " The weight of the produce you received was #{@visit.weight} pounds and you spent #{@visit.tab} Tabs"
    text " during your visit today."
   end

   def token_summary
     move_down 20
     text "You received Token Number #{@visit.token.id.to_s} worth #{@visit.token.initial_value.to_s} Tabs on #{@visit.token.issue_date.strftime('%B %d')}"
     text "You spent #{@visit.tab} today and you will have #{@visit.household.token_balance} Tabs to spend before #{@visit.household.token_expiration}"
     text "After #{@visit.household.token_expiration} you are eligible to receive #{@visit.token.initial_value.to_s} Tabs"
   end

   def hours
       text "Our hours at Main Street Market Place are"
       move_down 15
       text "Monday      10:00 AM - 3:00 PM"
       text "Tuesday     10:00 AM - 3:00 PM"
       text "Thursday    10:00 AM - 3:00 PM  Evening  5:30 PM 7:00 PM"
       text "Friday        10:00 AM - 3:00 PM"
   end

   def table
     move_down 20
     text "Everyone is welcome at the table"
   end

end