class InterviewsController < ApplicationController
  def index
    @user = current_user
    @interviews = @user.job_applications
  end
  def new
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
