Feature: Manage the user accounts
  To have different levels of access and control access to the more sensative sections
  As an admin I need to manage user accounts


  Scenario: Edit a user
    Given I am logged in
    Given I change the Test User's last name to Frog
    Then I should see "Frog" for the user
