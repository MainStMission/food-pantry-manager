Feature: Manage Donors
  As an admin I want to create, edit, and delete donors.


  Scenario: Creating a donors
    When I create a "donor" with these attributes:
      |name | Friendly Neighbor |
    Then I should see "Friendly Neighbor" for the "donor"

  Scenario: Editing a donor
    Given a "donor" exists
    When I edit a "donor" with these attributes:
      |name | Neighbor |
    Then I should see the new attributes for the "donor"

  Scenario: Deleting a donor
    Given a "donor" exists
    When I delete the "donor"
    Then I should not see the "donor"
