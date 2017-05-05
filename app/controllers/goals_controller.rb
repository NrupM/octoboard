class GoalsController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
      @goals = current_user.goals.all
      render :index
    else
      flash[:error] = "You must login to continue."
      redirect_to login_path
    end
  end

  def new
    if user_signed_in?
      @goal = Goal.new
      render :new
    else
      flash[:error] = "You must login to continue."
      redirect_to login_path
    end
  end

  def create
    @goal = current_user.goals.create(goal_params)
    if @goal.save
      redirect_to goals_path
    end
  end

  def edit
  end

  def update
  end

  private

  def goal_params
    params.require(:goal).permit(:daily_goal, :weekly_goal,:longterm_goal,:longterm_goal_date, :applications_per_day)
  end

end
