class GoalsController < ApplicationController
  before_action :is_user_logged_in?

  # no destroy function, user only works off of one goal and keeps updating it through the dash similar to a "status"
  def index
    @user = current_user
    @goal = @user.goals.first
    @octopower = @user.octopower
    @pending_count = current_user.job_applications.where(stage: 'pending_response').count
    @interviewing_count = current_user.job_applications.where(stage: 'interviewing').count
    @applications = current_user.job_applications

    # ALGORITHM FOR OCTOPOWER
    if (@user.goals.first)
      apps_per_day = @user.goals.first.applications_per_day
    else
      apps_per_day = 0
    end
    if (@user.job_applications.count > 0)
      @apps_applied_today = @user.job_applications.where({date_applied: Date.today}).count
      num_apps = @user.job_applications.count
    else
      @apps_applied_today = 0
      num_apps = 0
    end
    num_interviews = @user.interviews.count
    if @user.interviews.count > 0
      completed_challenges = @user.interviews.where({is_challenge_completed: true}).count
      nil_preparedness = @user.interviews.where({questions_to_ask: '' || ' '}).count
      int_preparedness = num_interviews - nil_preparedness
      nil_thankyou = @user.interviews.where({thankyou_letter: '' || ' '}).count
      num_thankyous = num_interviews - nil_thankyou
      inperson_ints = @user.interviews.where({interview_type: "in_person"}).count
    else
      num_thankyous = 0
      int_preparedness = 0
      inperson_ints = 0
    end
    if @user.questions.count > 0
      nilquestions = @user.questions.where({answer: nil || '' || ' ' }).count
      questions = @user.questions.count
      answered = questions - nilquestions
    else
      answered = 0
    end

    thankyous = num_thankyous * 3
    preparedness = int_preparedness * 2
    answered_questions = answered * 2
    interviews = num_interviews * 5
    per_day_goal = meet_per_day_goal(apps_per_day, @apps_applied_today)
    inperson = inperson_ints * 10

    @octopower = (@octopower + thankyous + preparedness + answered_questions + interviews + per_day_goal + inperson)

    if @octopower > 95 && @user.job_status == 'seeking'
      @octopower == 95
    else
      @octopower == 100
    end
    # END OCTOPOWER ALGORITHM

    # interviews needing followup
    @upcoming_interviews = @user.interviews.where(['interview_date > ?', DateTime.now])
    @upcoming_challenges = @user.interviews.where(['coding_challenge_due_date > ?', DateTime.now])


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

  def meet_per_day_goal (per_day_goal, actual_apps_per_day)
    n = per_day_goal
    if n > 0
      if (actual_apps_per_day == n || actual_apps_per_day > n)
        return n
      else
        return actual_apps_per_day
      end
    else
      return 0
    end
  end

end
