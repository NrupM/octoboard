class UsersController < ApplicationController
  before_action :is_user_logged_in?

  def show
    @user = current_user
  end



  

end
