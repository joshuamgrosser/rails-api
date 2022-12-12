class CommentsController < ApplicationController

  def create
    @article = params[:article_id]
    Article.find(@article).comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commentor, :body)
  end
end
