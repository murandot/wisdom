class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, except: [:index, :new, :create]

  def index
    @questions = Question.all.order('created_at DESC')
  end 

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @question.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @question.update(question_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to homes_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :genre_id, :school_category_id).merge(user_id: current_user.id)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end

end
