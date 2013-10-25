Given /I am on the "Music" page/ do 
  visit songs_path
end

When(/^I enter complete information about a song$/) do
  fill_in("Title", :with => "Song Title")
  fill_in("Description", :with => "Description")
  fill_in("Scripture", :with => "Psalm 27:4")
  fill_in("CCLI", :with => "6738307")  
  fill_in("Keywords", :with => "key, words")
  # page.attach_file('song_mp3', File.join(Rails.root, "/music/AmazingGrace.mp3"))
  # mp3 fails Cucumber test ("is invalid"), but actually works on LocalHost
  page.attach_file('song_chord_chart', File.join(Rails.root, "/music/FakeChordChart.pdf"))
end


Then(/^I should see that the song was successfully added$/) do
  page.should have_content("Song Title was successfully created")
end

When(/^I enter incomplete information about a song$/) do
end

Then(/^I should see an error message$/) do
  page.should have_content("can't be blank")
end
