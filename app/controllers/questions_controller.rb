class QuestionsController < ApplicationController

  #no show controller, all edit actions happen on main questions page.
  def index
    @user = current_user
  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
