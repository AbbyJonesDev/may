Feature:  Create a new article
  As a site owner or writer
  In order to share my ideas with the community
  I should be able to create a new article

Background:


Scenario:
  Given I am logged in as a site owner
  And I am on the "Articles" page
  When I click on "New"
  And I fill in "Title" with "My First Article"
  And I fill in "Body" with "This is the text of my article"
  And I fill in "Keywords" with "test, blog"
  And I attach a photo with path "/app/assets/images/coffee_cup.jpg"
  And I click on "Create Article"
  Then I should see the title, full text, keywords, and photo for "My First Article"

Scenario:
  Given I am not logged in
  And I am on the "Articles" page
  Then I should not see a "New" link

Scenario:
  Given I am logged in as a visitor
  Then I should not see a "New" link