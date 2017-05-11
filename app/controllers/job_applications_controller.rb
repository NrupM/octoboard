class JobApplicationsController < ApplicationController
  before_action :is_user_logged_in?

  def index
    @user = current_user
    @applications = JobApplication.where(user_id: current_user.id).order('updated_at DESC').paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @application = JobApplication.new
  end

  def create
    @application = current_user.job_applications.create(job_application_params)
    if @application.save
      if @application.stage == 'interviewing'
        flash[:success] = 'Your application has been saved. Please fill in interview details.'
        redirect_to new_interview_path(job_application_id: @application.id)
      else
        flash[:success] = 'Your application has been saved.'
        redirect_to job_applications_path
      end
    else
      flash[:error] = 'An error occurred saving your application details. Please try again.'
      redirect_to new_job_application_path
    end
  end

  def show
    @application = JobApplication.find_by_id(params[:id])
    @interviews = @application.interviews.all
  end

  def search_job_apps
    @applications = JobApplication.where(user_id: current_user.id)
    if params[:search]
      @search_results = @applications.search_job_apps(params[:search]).order('updated_at DESC').paginate(:page => params[:page], :per_page => 20)
    end
  end

  def edit
    @application = JobApplication.find_by_id(params[:id])
  end

  def update
    @application = JobApplication.find_by_id(params[:id])
    if @application.stage == 'interviewing'
      if @application.update_attributes(job_application_params)
        flash[:success] = "Application updated successfully."
        redirect_to job_application_path
      else
        flash[:error] = 'There was an error updating your job application. Please try again.'
        redirect_to :back
      end
    else
      if @application.update_attributes(job_application_params)
        flash[:success] = "Application updated successfully."
        if @application.stage == 'interviewing'
          redirect_to new_interview_path(job_application_id: @application.id)
        else
          redirect_to job_application_path
        end
      else
        flash[:error] = 'There was an error updating your job application. Please try again.'
        redirect_to :back
      end
    end
  end

  def destroy
    @application = JobApplication.find_by_id(params[:id])
    @application.destroy
    flash[:success] = 'Your application has been successfully deleted.'
    redirect_to job_applications_path
  end

  private

  def job_application_params
    params.require(:job_application).permit(:job_title, :company_name, :location, :application_method, :stage, :date_applied, :job_post_url, :job_description, :tech_stack, :job_requirements, :why_interested, :relevant_work_history, :submitted_cover_letter, :requested_salary, :notes)
  end

end
