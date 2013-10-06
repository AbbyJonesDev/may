require 'spec_helper'

describe Article do 

   it "should validate that user is an admin" do
      user = FactoryGirl.create(:user)
      article = FactoryGirl.build(:article)
      author = User.find_by_id(article.user_id)
      expect(author.admin).to eq(true)
  end

  it "should validate presence of title" do

  end

  it "should validate presence of body" do

  end

  it "should check content type if a photo is attached" do

  end

  it "should check attachment size if a photo is attached" do

  end

  
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

end