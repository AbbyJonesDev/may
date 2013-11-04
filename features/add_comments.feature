Feature: Add Comments
  As a site visitor
  In order to interact with the site owner
  I should be able to leave comments

Scenario:
  Given I am logged in as a visitor
  Then I should be able to leave comments

Scenario:
  Given I am logged in as a visitor
  And I have left comments before
  Then I should be able to edit my comments
  But I should not be able to edit other people's comments

Scenario:
  Given I am not logged in
  Then I should not be able to edit comments