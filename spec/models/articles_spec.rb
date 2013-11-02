require 'spec_helper'

describe Article do 

   

  # it "should validate presence of title" do

  # end

  # it "should validate presence of body" do

  # end

  # it "should check content type if a photo is attached" do

  # end

  # it "should check attachment size if a photo is attached" do

  # end

  
  #  From Paperclip documentation
 
  # it { should validate_attachment_content_type(:avatar).
  #               allowing('image/png', 'image/gif').
  #               rejecting('text/plain', 'text/xml') }
  # it { should validate_attachment_size(:avatar).
  #               less_than(2.megabytes) }

  it "should pull out the first 24 words of an article" do
    article = FactoryGirl.build(:article)
    expect(article.preview).to eq("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...")
  end



##  From Michael Hartl tutorial
# describe User do

#   before do
#     @user = User.new(name: "Example User", email: "user@example.com")
#   end

#   subject { @user }

#   it { should respond_to(:name) }
#   it { should respond_to(:email) }

#   it { should be_valid }

#   describe "when name is not present" do
#     before { @user.name = " " }
#     it { should_not be_valid }
#   end
end