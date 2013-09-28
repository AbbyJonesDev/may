Feature: Blog page
  Visitors to Brian's site
  Should be able to read his blog posts
  To increase their engagement with his ministry

  Background:
    Given an article by "tester" titled "test" with body:
      """
      Hello world!
      """

  Scenario:  Viewing articles home page
    Given I am on the "Articles" page
    Then I should see a list of blog posts



  Scenario: Viewing articles home page
    Given I am on the home page
    And I click on "Articles"
    Then I should be on the "Articles" page
    Then I should see a list of blog posts
    And each blog post should have a title
    And each blog post should have a picture
    And I should see the first few lines of each post


