class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.where(school_category_id: current_user.school_category_id).limit(3).order('created_at DESC')
    @questions = Question.limit(5).order('created_at DESC')
    @materials = Material.where(subject_id: current_user.subject_id).limit(6).order('created_at DESC')
  end

end
