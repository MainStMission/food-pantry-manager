Feature: Manage Neighbors
  As an admin I want to create, edit and manage Neighbors

Scenario: Creating a neighbor
    When I create a neighbor with these attributes

      |first_name | Anne |
      |last_name | Corriher|
      |phone | 555-111-2222 |
      |street | 1201 Main Street |
      |city | China Grove |
      |state | NC |
      |zip | 28023 |
      |ss_numb | 023-56-4431 |
      |monthly_income | 400.11 |
      |food_stamps |  200.33 |
      |rent | 120.22 |
      |utilities | 250.44 |
      |number_of_children | 3 |
      |proof_of_residency_type | passport |
      |notes | One child is diabetic. |

    Then I should see Anne

  Scenario: Editing a neighbor
    Given a neighbor exists
    When I edit a neighbor with new attributes
    Then I should see the new attributes for the neighbor

  Scenario: Deleting a neighbor
    Given a neighbor exists
    When I delete the neighbor
    Then I should not see the neighbor
