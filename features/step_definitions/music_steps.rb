Given /I am on the "Music" page/ do 
  visit songs_path
end


When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

  
When(/^I click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that the song was successfully added$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter incomplete information about a song$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an error message$/) do
  pending # express the regexp above with the code you wish you had
end
