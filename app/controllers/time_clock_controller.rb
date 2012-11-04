# -*- encoding : utf-8 -*-
class TimeClockController < ApplicationController
  helper_method :volunteers

  def show
  end

  def volunteers
    @volunteers ||= Volunteer.all
  end
end
