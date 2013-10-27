class UsersController < ApplicationController

  before_filter :check_admin_logged_in!, :only => [:index]

  def new
    #Form to create a new user
    #For admins only - will have option to select type of user
  end

  def create
    #Creates new user account
    #Redirects to confirmation page upon successful account creation
  end

  def edit
    #Displays form for editing an existing user
    #Only admin level users can edit a user besides him/herself
  end

  def update
    #Applies changes from edit form
    #Redirects to confirmation page upon completion of successful changes
  end

  def show
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
      params.require(:user).permit(:name, :email, :password)
    end


end
