Feature: Manage Households

 As an admin I want to create and manage households with Neighbors

 Scenario: Creating a Household

  When I create a household with this attribute

     |household_name  |Brooke|

  Then I should see 'Brooke'


 Scenario: Adding Neighbors to Households

