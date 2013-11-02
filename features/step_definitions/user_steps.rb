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

Then(/^I should not be able to edit users$/) do
  page.should have_no_link("Manage Users")
end