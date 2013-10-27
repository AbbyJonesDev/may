Then(/^I should see a list of all users$/) do
  User.all.each do |user|
    page.should have_content(user.name)
  end
end