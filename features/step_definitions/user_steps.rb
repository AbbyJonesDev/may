Then(/^I should see a list of all users$/) do
  User.all.each do |user|
    page.should have_content(user.name)
  end
end

Then(/^I can select a user$/) do
  click_link("Name One")
end

Then(/^I can edit user's admin status$/) do
  check('Admin')
  click_on("Update User")
  page.should have_content("successfully updated")
end

Then(/^I can delete the user$/) do
  click_on("Delete")
  page.should have_content("deleted")
end

Then(/^I can view articles by the user$/) do
  # @article = Article.create(title: "Title", body: "Article body", user_id: User.find_by_name("Name One").id)
  # page.all('tr', :text => "Name One").click_link("1 Article")
  # page.should have_content(@article)
  pending
end

Then(/^I can view comments by the user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not be able to edit users$/) do
  page.should have_no_link("Manage Users")
end