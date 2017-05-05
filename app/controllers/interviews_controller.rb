class InterviewsController < ApplicationController
  def index
    @user = current_user
    @interviews = @user.interviews.all
  end
  def new
    @interview = Interview.new
  end
  def create
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end

end
