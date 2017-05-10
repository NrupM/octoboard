class GoalsController < ApplicationController
  before_action :is_user_logged_in?

  # no destroy function, user only works off of one goal and keeps updating it through the dash similar to a "status"
  def index
    @user = current_user
    @goal = @user.goals.first
    @questions = @user.questions
    @interviews = @user.interviews
    @applications = @user.job_applications
    @octopower = @user.octopower
    @pending_count = @applications.where(stage: 'pending_response').count
    @interviewing_count = @applications.where(stage: 'interviewing').count

    # ALGORITHM FOR OCTOPOWER
    if @goal
      apps_per_day_goal = @goal.applications_per_day
    else
      apps_per_day_goal = 1
    end
    if @applications.count > 0
      @apps_applied_today = @applications.where({date_applied: Date.today}).count
      num_apps = @applications.count
    else
      @apps_applied_today = 0
      num_apps = 0
    end
    if apps_per_day_goal
      @goal_hitting_rate = @apps_applied_today.to_f/apps_per_day_goal*100
    end

    num_interviews = @interviews.count
    if @interviews.count > 0
      completed_challenges = @interviews.where({is_challenge_completed: true}).count
      nil_preparedness = @interviews.where({questions_to_ask: '' || ' '}).count
      int_preparedness = num_interviews - nil_preparedness
      nil_thankyou = @interviews.where({thankyou_letter: '' || ' '}).count
      num_thankyous = num_interviews - nil_thankyou
      @inperson_ints = @interviews.where({interview_type: "in_person"}).count
      @online_ints = @interviews.where({interview_type: "online"}).count
      @phone_ints = @interviews.where({interview_type: "phone"}).count
    else
      num_thankyous = 0
      int_preparedness = 0
      @inperson_ints = 0
      @online_ints = 0
      @phone_ints = 0
    end
    if @questions.count > 0
      nilquestions = @questions.where({answer: nil || '' || ' ' }).count
      questions = @questions.count
      answered = questions - nilquestions
    else
      answered = 0
    end

    thankyous = num_thankyous * 3
    preparedness = int_preparedness * 2
    answered_questions = answered * 2
    interviews = num_interviews * 5
    per_day_goal = meet_per_day_goal(apps_per_day_goal, @apps_applied_today)
    inperson = @inperson_ints * 10

    @octopower = (@octopower + thankyous + preparedness + answered_questions + interviews + per_day_goal + inperson)

    if @octopower > 95 && @user.job_status == 'seeking'
      @octopower == 95
    else
      @octopower == 100
    end
    # END OCTOPOWER ALGORITHM


    # interviews needing followup
    @upcoming_interviews = @interviews.where(['interview_date > ?', DateTime.now]).order(interview_date: :asc).limit(4)

    @upcoming_challenges = @interviews.where(['coding_challenge_due_date > ?', DateTime.now])


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
