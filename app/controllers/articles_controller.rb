class ArticlesController < ApplicationController

  def show
    # @ makes the variable into an instance variable that will be available in the show view
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

end
