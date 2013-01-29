# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  decent_configuration do
    strategy StrongParametersStrategy
  end

  def render_unauthorized
    head 401
  end
end
