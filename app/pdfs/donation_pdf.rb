class DonationPdf < Prawn::Document
  def initialize(donation)
    super()
    @donation = donation
    donor_name
  end
  
  def donor_name
    text "Donor: #{@donation.donor_name}"
  end
end