class CommentsController < ApplicationController

def new
end

def create
  check_user_logged_in!
  @comment = Comment.new(comment_params)
  @comment.user = current_user
  @comment.article = Article.find(params[:article_id])
  if @comment.save
    flash[:notice] = "Comment added"
  else
    flash[:warning] = @comment.errors.full_messages
  end
  redirect_to article_path(@comment.article)
end

def edit
end

def show
end

def destroy
end

def index
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
    
  def comment_params
    params.require(:comment).permit(:body, :user, :article)
  end

end
