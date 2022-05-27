class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = @answer.question
    @answers = @question.answers
    if @answer.save
      redirect_to "/questions/#{@answer.question.id}"
    else
      render "question/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:content).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
