class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_user_logged_in?, :is_value_nil?

  def is_user_logged_in?
    unless user_signed_in?
      flash[:error] = 'Please sign in to continue.'
      redirect_to login_path
    end
  end

  def is_value_nil?(attribute_value)
    unless attribute_value.to_s.size < 1
      return true
    end
  end


end
