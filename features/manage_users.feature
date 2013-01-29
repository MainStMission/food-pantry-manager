Feature: Manage the user accounts
  To have different levels of access and control access to the more sensative sections
  As an admin I need to manage user accounts


  Scenario: Edit a user as admin
    Given I am logged in as admin
    Given I change the Test User's last name to Frog
    Then I should see "Frog" for the user

