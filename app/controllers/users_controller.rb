class UsersController < ApplicationController
  before_action :is_user_logged_in?

  def show
    @user = current_user
  end

  def octopower_calculator
    # starts out with 10 for signing up
    @user = current_user
    @octopower = @user.octopower
    apps_per_day = @user.goals.first.applications_per_day
    apps_applied_today = User.first.job_applications.where({date_applied: Date.today}).count
    num_apps = @user.job_applications.count
    num_interviews = @user.interviews.count
    completed_challenges = @user.interviews.where({is_challenge_completed: true}).count
    nilquestions = @user.questions.where({answer: nil || '' || ' ' }).count
    questions = @user.questions.count
    answered = questions - nilquestions
    nil_preparedness = @user.interviews.where({questions_to_ask: '' || ' '})
    int_preparedness = num_interviews - nil_preparedness
    nil_thankyou = @user.interviews.where({thankyou_letter: '' || ' '})
    num_thankyous = num_interviews - nil_thankyou


    thank yous: 5
    questionstoask: 5
    answered: 5
    hit per day goal: 5
    interviews: 10


    # max of 100

  end

  def meet_per_day_goal (per_day_goal, actual_apps_per_day, apps_per_day)
    n = apps_per_day
    if n > 0
      if (actual_apps_per_day == per_day_goal || actual_apps_per_day > per_day_goal)
        return n
      else
        return actual_apps_per_day
      end
    end
  end

end
