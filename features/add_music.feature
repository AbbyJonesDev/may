Feature: Music page
  As a musician
  In order to share original music with the public
  I should be able to post music to my website

Background:
  Given I am logged in as a site owner or writer
  And I am on the "Music" page

Scenario:
  When I click on "New" link

  And I fill in the following:
| Title          | You Are My Sunshine       |
| Description    | Cloudy days               |
| Scripture      | Psalm 27:4                |
| Copyright      | 2013                      |
| CCLI           | 6738307                 |
| Keywords       | sun, clouds                                                            |
| mp3            | https://us.songselect.com/songs/6016351/10-000-reasons-bless-the-lord  |  
  
  And I click "Save"
  Then I should see that the song was successfully added


Scenario:
  When I click on the "New" link
  And I enter incomplete information about a song
  And I click "Save"
  Then I should see an error message  
