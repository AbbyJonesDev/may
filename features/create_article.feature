Feature:  Create a new article
  As a site owner or writer
  In order to share my ideas with the community
  I should be able to create a new article

Background:
  Given I am logged in as a site owner or writer
  And I am on the "Articles" page

Scenario:
  When I click on "New"
  Then I should see the "new article" form
  When I fill in "Title" with "My First Article"
  And I fill in "Body" with "This is the text of my article"
  And I fill in "Keywords" with "test, blog"
  And I fill in "Photo" with "/Users/abigailjones/Pictures/coffee_cup.jpg"
  And I click "Save"
  Then I should be on the "Articles" page
  And I should see "My First Article"
  When I click on "My First Article"
  Then I should see the title, full text, keywords, and photo for my article