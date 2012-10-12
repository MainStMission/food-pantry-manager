Feature: Manage Customers
  As an admin I want to create, edit, and delete customers.


  Scenario: Creating a customer
    When I create a customer with these attributes
      |cust_first_name | Anne |
      |cust_last_name | Corriher |
      |cust_email | msm@example.com |
      |cust_phone | 555-111-2222 |
      |cust_street | 30 Main Street |
      |cust_city | Glendale |
      |cust_state | CA |
      |cust_zip | 91201 |
      |cust_status | active |
      
    Then I should see the new customer


  Scenario: Editing a customer
    Given a customer exits
    When I edit a customer with new attributes
    Then I should see the new attributes for the customer

  Scenario: Deleting a customer
    Given a customer exits
    When I delete the customer
    Then I should not see the customer
