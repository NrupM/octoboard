class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_value_nil? 

  def is_value_nil?(attribute_value)
    unless attribute_value.size < 1
      return true
    end
  end

end
