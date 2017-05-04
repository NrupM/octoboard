class GoalsController < ApplicationController
  def index
    if user_signed_in?
      render :index
    else
      flash[:error] = 'Please login to continue.'
      redirect_to login_path
    end
  end

  def edit
  end

  def update
  end

end
