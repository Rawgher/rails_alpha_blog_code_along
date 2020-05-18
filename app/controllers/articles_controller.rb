class ArticlesController < ApplicationController

  def show
    # @ makes the variable into an instance variable that will be available in the show view
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    # Have to whitelist articles by requiring the top level key article and permit the title and description
    # to come in at submission to create the new article instance
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to article_path(@article)
    # can also just use below code
    # redirect_to article_path(@article)
  end

end
