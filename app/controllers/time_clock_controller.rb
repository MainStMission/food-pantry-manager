# -*- encoding : utf-8 -*-
class TimeClockController < ApplicationController
  expose(:volunteers) { Volunteer.scoped.page params[:page] }
end
