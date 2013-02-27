# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe "/pdfs/donation_pdf.rb" do
  it "generates a pdf given a donation" do
    donation = FactoryGirl.create(:donation, :weight => 25)
    pdf = DonationPdf.new(donation)
    file = pdf.render_file "test.pdf"
    reader = PDF::Reader.new(File.open(file))
    reader.pages.first.text.should match(/Donor: #{donation.donor_name}/)
  end
end
