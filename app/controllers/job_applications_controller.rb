class JobApplicationsController < ApplicationController
  def index
    @user = current_user
    @applications = JobApplication.where(user_id: current_user.id)
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

  private

  def job_application_params
  end

end
