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
      |monthly_income | 400.00 |
      |food_stamps |  200.00 |
      |rent | 120.00 |                   
      |utilities | 250.00 |              
      # |residency_date | 2002-12-10 |
      # |spouse | true |
      |number_of_children | 3 |
      # |open_date | 2009-02-10 |
      # |close_date | 2012-04-05 |
      |proof_of_residency_type | passport |
      # |date_of_proof | 2001-05-06 |
      # |smokes | true |

    Then I should see Anne

  Scenario: Editing a neighbor
    Given a neighbor exists
    When I edit a neighbor with new attributes
    Then I should see the new attributes for the neighbor

  Scenario: Deleting a neighbor
    Given a neighbor exists
    When I delete the neighbor
    Then I should not see the neighbor