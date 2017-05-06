class QuestionsController < ApplicationController
  before_action :is_user_logged_in?

  #no show controller, work from the index page.
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
    @question= Question.find(params[:id])
  end

  def update
    @question= Question.find(params[:id])

    if @question.update_attributes(question_params)
      flash[:success] = "Question updated successfully."
      redirect_to questions_path
    else
      flash[:error] = @question.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  def destroy
    @question= Question.find(params[:id])
    @question.destroy
    flash[:success] = "Your question was successfully deleted."
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:prompt, :answer)
  end

end
