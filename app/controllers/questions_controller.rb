class QuestionsController < ApplicationController

  #no show controller, all edit actions happen on main questions page.
  def index
    @user = current_user
    @questions = @user.questions.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(question_params)
    if @question.save
      redirect_to questions_path
    else
      flash[:error] = 'An error occurred saving your question. Please try again.'
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:prompt, :answer)
  end

end
