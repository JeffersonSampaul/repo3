class ArticlesController < ApplicationController
   
  before_action :set_article_detail, only: [:show]
  def new
    @article = Article.new 
  end

  def create
    @article = Article.new(article_params) 
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @articles = Article.all
  end

  private
   
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article_detail
    @article = Article.find(params[:id])
  end
end
