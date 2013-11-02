Then(/^I should see a list of all users$/) do
  User.all.each do |user|
    page.should have_content(user.name)
  end
end

Then(/^I can select a user$/) do
  click_link("Name One")
end

Then(/^I can add a new user$/) do
  fill_in("Name", :with => "New Name")
  fill_in("Email", :with => "NewEmail@email.com")
  fill_in("Password", :with => "password")
  fill_in("Password confirmation", :with => "password")
  check('Admin')
  click_on("Create User")
  save_and_open_page
  page.should have_content("successfully created")
end

Then(/^I can edit user details$/) do
  fill_in("Name", :with => "New Name")
  fill_in("Email", :with => "NewEmail@email.com")
  check('Admin')
  click_on("Update User")
  page.should have_content("successfully updated")
end

Then(/^I should not be able to edit users$/) do
  page.should have_no_link("Manage Users")
end