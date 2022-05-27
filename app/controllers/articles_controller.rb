class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, except: [:index, :new, :create]

  def index
    @articles = Article.all.order('created_at DESC')
  end 

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @article.comments
  end

  def edit
    unless @article.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @article.update(article_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to homes_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :genre_id, :school_category_id, :image).merge(user_id: current_user.id)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end

end
