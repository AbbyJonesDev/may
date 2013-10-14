class ArticlesController < ApplicationController

  # ensure admin for other actions
  before_filter :check_admin_logged_in!, :except => [:show, :index]



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
    if @article.save
      flash[:notice] = "#{@article.title} was successfully created."
      redirect_to @article
    else
      flash[:warning] = @article.errors.full_messages
      render action: 'new'
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    @article.update(title: params[:article][:title], body: params[:article][:body], keywords: params[:article][:keywords] )
    if params[:article][:photo]
      @article.update(photo: params[:article][:photo])
    end
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

  private
    def check_admin_logged_in! # if admin is not logged in, user must be logged in as admin
      if !current_user.try(:admin?)
        flash[:notice] = "You must be an administrator to perform this function."
        return redirect_to articles_path
      end   
    end
    def check_user_logged_in! # User must be logged in
      if !user_signed_in?
        authenticate_user!
      end
    end

  
end
