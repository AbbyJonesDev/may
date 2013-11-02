class UsersController < ApplicationController

  before_filter :check_admin_logged_in!, :only => [:index]

  def new
    if current_user.try(:admin?)
      @user = User.new
    else
      flash[:warning] = "You must be an administrator to perform this function."
      return redirect_to '/'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.email} was successfully created."
      redirect_to @user
    else
      flash[:warning] = @user.errors.full_messages
      render action: "new"
    end
  end


  def edit
    if current_user.try(:admin?)
      @user = User.find(params[:id])
    elsif session[:current_user] == params[:id]
      @user = params[:id]
    else
      flash[:warning] = "You must be an administrator to perform this function."
      return redirect_to '/'
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      flash[:notice] = "#{@user.email} was successfully updated."
      redirect_to users_path
    else
      flash[:warning] = @user.errors.full_messages
      render action: "edit"
    end 
  end 

  def show
    if current_user.try(:admin?)
      @user = User.find(params[:id])
    elsif session[:current_user] == params[:id]
      @user = params[:id]
    else
      flash[:warning] = "You must be an administrator to perform this function."
      return redirect_to '/'
    end
  end

  def index
    @users = User.all
  end

  def delete
  end

  def confirmation
  end

  private
    def check_admin_logged_in! # if admin is not logged in, user must be logged in as admin
      if !current_user.try(:admin?)
        flash[:notice] = "You must be an administrator to perform this function."
        return redirect_to "/"
      end   
    end
    def check_user_logged_in! # User must be logged in
      if !user_signed_in?
        authenticate_user!
      end
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :admin)
    end


end
