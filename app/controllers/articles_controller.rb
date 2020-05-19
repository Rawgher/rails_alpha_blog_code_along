class ArticlesController < ApplicationController

  def show
    # @ makes the variable into an instance variable that will be available in the show view
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # adding so that the new page does not error out on load due to the articles.error portion
    @article = Article.new
  end

  def create
    # Have to whitelist articles by requiring the top level key article and permit the title and description
    # to come in at submission to create the new article instance
    @article = Article.new(params.require(:article).permit(:title, :description))
    # adding if/else statement to handle if the form is submitted and missing a field
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to article_path(@article)
    else
      render 'new'
    end
    # can also just use below code
    # redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
