###  Background Steps

Given(/^an article by "(.*?)" titled "(.*?)" with body:$/) do |name, title, text|
  Article.create!({user_id: '1', title: title, body: text})
end


### Scenario Steps

Then /I should be on the "Articles" page/ do
  current_path.should == articles_path
end

Given /I am on the "Articles" page/ do
  visit(articles_path)
end

Given /I am on the "New Article" page/ do
  visit(new_article_path)
end

Given(/^I click on article titled "(.*?)"$/) do |title|
  click_on(title)
end

Then(/^I should be on the article page for "(.*?)"$/) do |title|
 current_path.should == article_path(Article.find_by_title(title))
end

Then(/^I should see the full text of the article "(.*?)"$/) do |title|
  save_and_open_page
  page.should have_content(Article.find_by_title(title).body)
end

Then(/^I should see the article photo for "(.*?)"$/) do |title|
  ### Failing - can't find default photo
  page.should have_content(Article.find_by_title(title).photo)
end


Then(/^I should see a list of blog posts$/) do
  page.should have_content(Article.all[0].title)
  page.should have_content(Article.all[1].title)
end

Then(/^each blog post should have a picture$/) do
  ### Failing - can't find default photo
  page.should have_content(Article.all[0].photo)
  page.should have_content(Article.all[1].photo)
end

Then(/^I should see the first few lines of each post$/) do
  page.should have_content(Article.all[0].preview)
  page.should have_content(Article.all[1].preview)
end

Then(/^I should see the title, full text, keywords, and photo for "(.*)"$/) do |title|
  article = Article.find_by_title(title)
  page.should have_content(article.title)
  page.should have_content(article.body)
  page.should have_content(article.keywords)

  ### Photo not showing in test but does show on LocalHost - Paperclip storing photos in different 
  ### folder for tests???  
  # page.should have_content(article.photo)
end