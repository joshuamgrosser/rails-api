class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles, include: :comments
  end

  def show
    @article = Article.find(params[:id])
    render json: @article, include: :comments
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article
    else
      render json: @article.errors
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: { message: "Article #{@article.id} deleted" }
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
