class ArticlesController < ApplicationController
  def index
    articles = Article.open.includes(:category)
    @articles = Article.search_articles(articles, params)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end

  private
  def article_params
    params.require(:article).permit(
      :title,
      :body,
      :status,
      :category_id,
      :user_id,
    )
  end

end
