class ArticlesController < ApplicationController


  def new
    @article = Article.new
    # debugger
  end

  def create
    debugger
    # Uncomment line 12 when ready to make Cucumber test go green
    # @article = Article.create!(params.require(:article).permit!)
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
    # debugger
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)
  end

end
