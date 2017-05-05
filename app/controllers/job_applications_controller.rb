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
    @application = JobApplication.find_by_id(params[:id])
  end

  def edit
    @application = JobApplication.find_by_id(params[:id])
  end

  def update
    @application = JobApplication.find_by_id(params[:id])

    if @application.update_attributes(job_application_params)
      flash[:success] = "Application updated successfully."
      if @application.stage == 'interviewing'
        redirect_to new_interview_path(job_application_id: @application.id)
      else
        redirect_to job_application_path
      end
    else
      flash[:error] = @application.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  def destroy
    @application = JobApplication.find_by_id(params[:id])
    @application.destroy
    flash[:success] = "Your application has been successfully deleted."
    redirect_to job_applications_path
  end

  private

  def job_application_params
    params.require(:job_application).permit(:job_title, :company_name, :location, :application_method, :stage, :date_applied, :job_post_url, :job_description, :tech_stack, :job_requirements, :why_interested, :relevant_work_history, :submitted_cover_letter, :requested_salary, :notes)
  end

end
