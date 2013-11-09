Given(/^I am on the "(.*?)" article page$/) do |article|
  @article = Article.create(user_id: '1', title: article, body: "Please comment on me")
  @comment = Comment.create(user_id: '1', article_id: @article.id, body: "My comment")
  @comment2 = Comment.create(user_id: '1', article_id: @article.id, body: "My second comment")
  @comment3 = Comment.create(user_id: '1', article_id: @article.id, body: "My third comment")
  @comment4 = Comment.create(user_id: '7', article_id: @article.id, body: "Not my comment")
  visit(article_path(Article.find_by_title(article)))
end

Then(/^I should be able to leave comments$/) do
  fill_in("Comment", :with => "This is my insightful comment")
  click_on("Post")
  page.should have_content("This is my insightful comment")
end

Given(/^I have left comments before$/) do
  #Covered in previous step
end

Then(/^I should be able to delete my comments$/) do
  page.find("#comment#{@comment.id}").click_link("Delete")
  page.should have_no_content("My comment")
end

Then(/^I should not be able to delete other people's comments$/) do
  # Comment4 created in previous step with other user ID
  page.find("#comment#{@comment4.id}").should have_no_link("Delete")
end

Then(/^I should not be able to delete comments$/) do
  visit(article_path(@article))
  # Syntax in line below is not specific to deleting comments, but 
  # in the scenario of not being logged in, there shouldn't be any 
  # links to delete anything.
  page.should have_no_link("Delete")
end