Feature: Manage Households

 As an admin I want to create and manage households with Neighbors

 Scenario: Creating a Household

  When I create a "household"  with this attribute

     | household_name |Bronson|

  Pending Then I should see "Bronson" for the household name


 Scenario: Adding Neighbors to Households

