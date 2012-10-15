Feature: Manage the user accounts
  To have different levels of access and control access to the more sensative sections
  As an admin I need to manage user accounts

  Scenario: Create a user account
    Given I create a user with these attributes
      | first_name |  Kermit |
      | last_name  |  Frog |
    Then I should see "Kermit Frog" for the user

  Scenario: Edit a user
    Given I change Piggy's last name to Frog
    Then I should see "Piggy Frog" for the user
