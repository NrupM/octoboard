class GoalsController < ApplicationController
  before_action :is_user_logged_in?

  # no destroy function, user only works off of one goal and keeps updating it through the dash similar to a "status"
  def index
    @user = current_user
    @goals = current_user.goals.all
    @pending_count = current_user.job_applications.where(stage: 'pending_response').count
    @interviewing_count = current_user.job_applications.where(stage: 'interviewing').count
    @coding_challenges = current_user.interviews.where(coding_challenge_due_date: 'interviewing')
    # @coding_challenges_count = @coding_challenges.where(coding_challenge_due_date: )
  end

  def new
    @goal = Goal.new
  end

  def create
    if current_user.goals.count == 0
      @goal = current_user.goals.create(goal_params)
      if @goal.save
        redirect_to goals_path
      else
        flash[:error] = 'An error occurred creating your goal. Please try again.'
        redirect_to :back
      end
    else
      flash[:error] = 'Update your current goal instead!'
      redirect_to '/goals'
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      flash[:success] = "Goal updated successfully."
      redirect_to '/goals'
    else
      flash[:error] = @goal.errors.full_messages.join(". ")
      redirect_to :back
    end

  end

  private

  def goal_params
    params.require(:goal).permit(:daily_goal, :weekly_goal,:longterm_goal,:longterm_goal_date, :applications_per_day)
  end

end
