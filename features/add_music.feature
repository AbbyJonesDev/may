Feature: Music page
  As a musician
  In order to share original music with the public
  I should be able to post music to my website

Background:
  Given I am logged in as a site owner or writer
  And I am on the "Music" page

Scenario:
  When I click on "New" link
  And I enter complete information about a song
  And I click "Create Song"
  Then I should see that the song was successfully added

Scenario:
  When I click on the "New" link
  And I enter incomplete information about a song
  And I click "Create Song"
  Then I should see an error message  

Scenario:
  When I am logged out
  Then I should not be able to add music