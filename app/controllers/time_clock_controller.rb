# -*- encoding : utf-8 -*-
class TimeClockController < ApplicationController

  def show
    @volunteers = Volunteer.all
  end

end
