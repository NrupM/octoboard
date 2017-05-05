class JobApplicationsController < ApplicationController
  def index
    @user = current_user
    @applications = JobApplication.where(user_id: current_user.id)
  end

  def new
    if user_signed_in?
      @application = JobApplication.new
      render :new
    else
      flash[:error] = "You must login to continue."
      redirect_to login_path
    end
  end

  def create
    @application = current_user.job_applications.create(job_application_params)
    if @application.save
      redirect_to job_applications_path
    else
      flash[:error] = 'An error occurred saving your application details. Please try again.'
      redirect_to :back
    end
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
    params.require(:job_application).permit(:job_title, :company_name, :location, :application_method, :stage, :date_applied, :job_post_url, :job_description, :tech_stack, :job_requirements, :why_interested, :relevant_work_history, :submitted_cover_letter, :requested_salary, :notes)
  end

end
