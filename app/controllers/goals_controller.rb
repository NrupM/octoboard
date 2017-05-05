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
