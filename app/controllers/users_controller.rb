class UsersController < ApplicationController
  before_action :is_user_logged_in?

  def show
    @user = current_user
  end

  def octopower_calculator
    @user = current_user
    @octopower = @user.octopower
    apps_per_day = @user.goals.first.applications_per_day
    average_per_day =
    num_apps = @user.job_applications.count
    num_interviews = @user.interviews.count
    User.first.interviews.where({is_challenge_completed: true})
    completed_challenges =
    nilquestions = @user.questions.where({answer: nil }).count
    questions = @user.questions.count
    answered = questions - nilquestions



    //combo of how mnay coding challenges youve done
  end

end
