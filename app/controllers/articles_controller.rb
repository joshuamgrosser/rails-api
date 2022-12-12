class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render jsonapi: Article.all
  end

  def show
    @article = Article.find(params[:id])
    render jsonapi: @article, include: :comments
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render jsonapi: @article
    else
      render jsonapi_errors: @article.errors
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render jsonapi: @article
    else
      render jsonapi_errors: @article.errors
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render status: :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
