class ArticlesController < ApplicationController
  # sending the method created below before running actions
  # this action only takes place for the functions listed in []s
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    # @articles = Article.all
    # replace above code with this to allow for pagination using the will_paginate gem
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    # adding so that the new page does not error out on load due to the articles.error portion
    @article = Article.new
  end

  def create
    # Have to whitelist articles by requiring the top level key article and permit the title and description
    # to come in at submission to create the new article instance
    @article = Article.new(article_params)

    # accession the sessions current user to assign an author to the blog post
    @article.user = current_user

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
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # private makes any methods listed after it only accessible by this file, does not need an end block
  # always add private toward the bottom of your code to make sure other methods don't become private by accident
  private

  def set_article
    # @ makes the variable into an instance variable that will be available in the show view
    @article = Article.find(params[:id])
  end

  # function for adding required parameters to create and update actions above
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end
