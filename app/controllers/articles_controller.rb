class ArticlesController < ApplicationController


  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.keywords = params[:article][:keywords]
    @article.photo = params[:article][:photo]
    @article.user_id = current_user.id
    @article.save!
    flash[:notice] = "#{@article.title} was successfully created."
    redirect_to articles_path
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    @article.update_attributes!(params[:article])
    flash[:notice] = "#{@article.title} was successfully updated."
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article '#{@article.title}' deleted."
    redirect_to articles_path
  end

  def index
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)
  end

end
