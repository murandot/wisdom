class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @materials = @user.materials
    @articles = @user.articles
    @questions = @user.questions
  end
  
end
