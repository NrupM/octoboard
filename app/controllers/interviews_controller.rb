class InterviewsController < ApplicationController
  def index
    @user = current_user
    @interviews = @user.interviews.all
  end
  def new
    @interview = Interview.new
    @application = JobApplication.find_by_id(params[:job_application_id])
    @applicationscount = current_user.job_applications.count
    @applications = JobApplication.where(user_id: current_user.id)
  end

  def create
    @interview = current_user.interviews.create(interview_params)
    if @interview.save
      redirect_to interviews_path
    else
      flash[:error] = 'An error occurred saving your interview details. Please try again.'
      redirect_to :back
    end
  end

  def show
    @interview = Interview.find_by_id(params[:id])
  end

  def edit
    @interview = Interview.find_by_id(params[:id])
  end

  def update
    @interview = Interview.find_by_id(params[:id])

    if @interview.update_attributes(interview_params)
      flash[:success] = "Interview updated successfully."
      redirect_to interview_path
    else
      flash[:error] = @interview.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  def destroy
    @interview = Interview.find_by_id(params[:id])
    @interview.destroy
    flash[:success] = "Your interview was successfully deleted."
    redirect_to interviews_path
  end

  private

  def interview_params
    params.require(:interview).permit(:job_application_id, :interview_date, :interview_type, :is_followup_needed, :primary_contact_name, :primary_contact_title, :primary_contact_email, :primary_contact_phone, :questions_to_ask, :thankyou_letter, :coding_challenge_url, :coding_challenge_due_date, :coding_challenge_prompt, :is_challenge_completed, :notes)
  end

end
