Feature: Manage Customers
  As an admin I want to create, edit, and delete customers.


  Scenario: Creating a customer
    When I create a customer with these attributes
      |first_name | Gonzo |
      |last_name | Great |
      |email | gonzo@example.com |
      |phone | 555-111-2222 |
      |street | 1201 Grand Central Avenue |
      |city | Glendale |
      |state | CA |
      |zip | 91201 |
      |status | active |
    Then I should see Gonzo

  Scenario: Editing a customer
    Given a customer exits
    When I edit a customer with new attributes
    Then I should see the new attributes for it

  Scenario: Deleting a cstomer
    Given a customer exits
    When I delete the customer
    Then I should not see the customer
