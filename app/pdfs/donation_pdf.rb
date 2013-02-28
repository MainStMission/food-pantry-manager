class DonationPdf < Prawn::Document
  def initialize(donation)
    super()
    @donation = donation
    logo_image
    donation_id
    donation_date
    donor_name
    thank_you_note
  end
  
  def donor_name
    text "Donor: #{@donation.donor_name}"
  end
  
  def logo_image
    image "#{Rails.root}/app/assets/images/msm_logo.png"
  end
  
  def donation_date
    text "Date: #{@donation.created_at.strftime('%B %d, %Y')}"
  end
  
  def donation_id
    text "Donation #: #{@donation.id}"
  end
  
  def thank_you_note
    move_down 10
    font_size 16
    text "Thank you for your donation of:"
    move_down 10 
    text "#{@donation.weight} pounds of food"
    move_down 10
    text "to Main Street Mission."
  end
end