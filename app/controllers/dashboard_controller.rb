class DashboardController < ApplicationController
  #before_filter :authenticate
  before_filter :load_dashboard

  def household_summary
    render json: @dashboard.household_summary
  end

  def visit_summary
    render json: @dashboard.visit_summary
  end

  def neighbor_summary
    render json: @dashboard.neighbor_summary
  end

  def donor_summary
    render json: @dashboard.donor_summary
  end

  private

  def donation_summary
     render json: @dashboard.donation_summary
  end

  def load_dashboard
    @dashboard = Dashboard.new
  end

  def authenticate
    authenticate_or_request_with_http_digest("MOMMA") do |username|
      u = app_config['dashboard']['tmb']
      p = app_config['dashboard']['tmb8518']

      username == u && Digest::MD5.hexdigest([u,"MOMMA",p].join(":"))
    end
  end
end