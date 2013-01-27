Feature: Manage Volunteers
  As an admin I want to create, edit, and delete volunteers.


  Scenario: Creating a volunteer
    When I create a volunteer with these attributes
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

  Scenario: Editing a volunteer
    Given a volunteer exists
    When I edit a volunteer with new attributes
    When I should see the new attributes for the volunteer

  Scenario: Deleting a volunteer
    Given a volunteer exists
    When I delete the volunteer
    Then I should not see the volunteer
