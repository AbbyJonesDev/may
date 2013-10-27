Then(/^I should see a list of all users$/) do
  User.all.each do |user|
    page.should have_content(user.name)
  end
end






Then(/^I should not be able to edit users$/) do
  page.should have_no_link("Manage Users")
end