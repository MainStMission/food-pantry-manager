# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base


  protect_from_forgery

  decent_configuration do
    strategy StrongParametersStrategy
  end
end
