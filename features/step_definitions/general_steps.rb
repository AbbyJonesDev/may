Given /I am on the home page/ do
  visit('/')
end

And /I click on "(.*)"/ do |link|
  click_on(link)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, :with => value)
end

And /I attach a photo with path "(.*)"/ do |path|
  page.attach_file('article_photo', File.join(Rails.root, path))
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should not see a "(.*?)" link$/) do |link|
  page.should have_no_link(link)
end



###################
#  User Steps     #
###################
Given(/^I am not logged in$/) do
  current_user = nil
end

Given(/^I am logged in as a visitor$/) do
  name = "visitor Name"
  email = 'visitor@man.net'
  password = 'visitorpass'
  User.new(name: name, email: email, password: password, password_confirmation: password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Given(/^I am logged in as a site owner or writer$/) do
  name = "My Name"
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(name: name, email: email, password: password, password_confirmation: password, admin: true).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end