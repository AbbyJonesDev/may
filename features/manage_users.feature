Feature: Manage Users
  As a site administrator
  In order to manage my site
  I should be able to add and edit user information

Background:
  Given I am logged in as a site owner
  And the site has registered users

Scenario:
  Given I click "Manage Users"
  Then I should see a list of all users
