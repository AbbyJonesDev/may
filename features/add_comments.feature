Feature: Add Comments
  As a site visitor
  In order to interact with the site owner
  I should be able to leave comments

Background:
  Given I am logged in as a visitor
  And I am on the "Thoughts Please" article page

Scenario:
  Then I should be able to leave comments

Scenario:
  When I have left comments before
  Then I should be able to delete my comments
  But I should not be able to delete other people's comments

Scenario:
  Given I am not logged in
  And I am on the "Thoughts Please" article page
  Then I should not be able to delete comments