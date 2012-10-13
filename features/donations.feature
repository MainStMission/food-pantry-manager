Feature: Manage Donations
  As an admin I want to create, edit, and delete donations.


  Scenario: Creating a donations
    When I create a "donation" with these attributes:
      |weight | 55.2 |
    Then I should see "55.2" for the "donation"

  Scenario: Editing a donation
    Given a "donation" exists
    When I edit a "donation" with these attributes:
      |weight | 34.4 |
    Then I should see the new attributes for the "donation"

  Scenario: Deleting a donation
    Given a "donation" exists
    When I delete the "donation"
    Then I should not see the "donation"
