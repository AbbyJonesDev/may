Feature: Manage Users
  As a site administrator
  In order to manage my site
  I should be able to edit user privileges

Background:
  Given I am logged in as a site owner
  And the site has registered users
  Given I click "Manage Users"
  Then I should see a list of all users

Scenario:
  And I can select a user
  And I can edit user's admin status

Scenario:
  And I can select a user
  And I can delete the user

Scenario:
  And I can view articles by the user

Scenario:
  And I can view comments by the user

Scenario:
  Given I am logged out
  Then I should not be able to edit users
