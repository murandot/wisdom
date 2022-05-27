class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @article = @comment.article
    @comments = @article.comments
    if @comment.save
      redirect_to "/articles/#{@comment.article.id}"
    else
      render "article/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, article_id: params[:article_id])
  end

end
