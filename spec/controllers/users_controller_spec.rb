require 'spec_helper'

def login_admin
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in FactoryGirl.create(:user, admin: true)
end

def login_user
  @request.env["devise.mapping"] = Devise.mappings[:user]
  user = FactoryGirl.create(:user)
  sign_in user
end

user2 = FactoryGirl.create(:user, email: "user2@email.com")


describe UsersController do

  
  
  describe "Block visitor or guest from editing other users" do
    before(:each)  do
      login_user
    end

    it "should not allow visitor to view user index" do
      get :index
      response.should redirect_to('/')
    end

    it "should not allow visitor to view another users profile" do
      get :show, id: user2.id
      response.should redirect_to('/')
    end

    it "should not allow visitor to edit another users profile" do
      get :edit, id: user2.id
      response.should redirect_to('/')
    end

  end


end
