Then(/^I should be able to leave comments$/) do
  @article = Article.create(user_id: '1', title: "Thoughts Please", body: "Please comment on me")
  visit(article_path(@article))
  fill_in("Comment", :with => "This is my insightful comment")
  click_on("Post")
  page.should have_content("This is my insightful comment")
end

Given(/^I have left comments before$/) do
  @article = Article.create(user_id: '1', title: "Thoughts Please", body: "Please comment on me")
  @comment = Comment.create(user_id: '1', article_id: @article.id, body: "My comment")
end

Then(/^I should be able to edit my comments$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not be able to edit other people's comments$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not be able to edit comments$/) do
  pending # express the regexp above with the code you wish you had
end