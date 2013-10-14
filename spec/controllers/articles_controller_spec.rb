require 'spec_helper'

def login_admin
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in FactoryGirl.create(:user)
end

def login_user
  @request.env["devise.mapping"] = Devise.mappings[:user]
  user = FactoryGirl.create(:user, admin: false)
  sign_in user
end

describe ArticlesController do

  describe "GET index" do
    it "assigns all articles as @articles" do
      article = FactoryGirl.create(:article)
      get :index
      assigns(:articles).should eq([article])
    end
    it "renders the index view" do 
      get :index 
      response.should render_template :index 
  end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      article = FactoryGirl.create(:article)
      get :show, id: article.id
      assigns(:article).should eq(article)
    end
  end


  describe "GET new" do
    ##  Visitors should not be able to view New page
    it "should not let visitors view New page" do
      # current_user = FactoryGirl.build(:user, admin: false)
      login_user
      get :new
      response.should redirect_to '/articles'
    end


    ## Admins should be able to visit New page
    it "assigns a new article as @article" do
      login_admin
      get :new
      assigns(:article).should be_a_new(Article)
    end
  
    it "should let admins visit New pages" do
      login_admin
      get :new 
      response.should render_template :new
    end
  end

  describe "GET edit" do
    ## Visitors should not be able to visit Edit page
    it "should not let visitors view Edit page" do
      current_user = FactoryGirl.build(:user, admin: false)
      @article = FactoryGirl.create(:article)
      get :edit, id: @article.id
      response.should redirect_to '/articles'
    end

    ## Admins should be able to visit Edit page
    it "assigns the requested article as @article" do
      login_admin
      article = FactoryGirl.create(:article)
      get :edit, {:id => article.to_param}
      assigns(:article).should eq(article)
    end
    it "should let admins visit Edit pages" do
      login_admin
      @article = FactoryGirl.create(:article)
      get :edit, id: @article.id 
      response.should render_template :edit
    end
  end

  describe "POST create" do
    before(:each) do
      login_admin
    end
    valid_attributes = {
        title: "Title",
        body: "Article body..." 
      }

    describe "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, :article => valid_attributes
          }.to change(Article, :count).by(1)
      end
 
      it "assigns a newly created article as @article" do
        post :create, {:article => valid_attributes}
        assigns(:article).should be_a(Article)
        assigns(:article).should be_persisted
      end
 
      it "redirects to the created article" do
        post :create, {:article => valid_attributes}
        response.should redirect_to(Article.last)
      end
    end
 
    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:article => {}}
        assigns(:article).should be_a_new(Article)
      end
 
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:article => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      login_admin
    end
    valid_attributes = {
        title: "Title",
        body: "Article body...",
        user_id: '1' 
      }

    describe "with valid params" do
      it "updates the requested article" do
        article = FactoryGirl.create(:article)
        debugger
        # Assuming there are no other articles in the database, this
        # specifies that the Article created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        article.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => article.id, :article => {'these' => 'params'}}
      end
 
      it "assigns the requested article as @article" do
        article = FactoryGirl.create(:article)
        put :update, {:id => article.to_param, :article => valid_attributes}
        assigns(:article).should eq(article)
      end
 
      it "redirects to the article" do
        article = FactoryGirl.create(:article)
        put :update, {:id => article.to_param, :article => valid_attributes}
        response.should redirect_to(article)
      end
    end
 
    describe "with invalid params" do
      it "assigns the article as @article" do
        article = FactoryGirl.create(:article)
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        put :update, {:id => article.to_param, :article => {}}
        assigns(:article).should eq(article)
      end
 
      it "re-renders the 'edit' template" do
        article = FactoryGirl.create(:article)
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        debugger
        put :update, {:id => article.to_param, :article => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      login_admin
    end
    it "destroys the requested article" do
      article = FactoryGirl.create(:article)
      expect {
        delete :destroy, {:id => article.to_param}
      }.to change(Article, :count).by(-1)
    end
 
    it "redirects to the articles list" do
      article = FactoryGirl.create(:article)
      delete :destroy, {:id => article.to_param}
      response.should redirect_to(articles_url)
    end
  end
  
 
end
