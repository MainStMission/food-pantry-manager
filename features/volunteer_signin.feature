Feature: Volunteer Sign in/out
  In order to keep track of volunteer hours
  As a volunteer
  I want to sign in and sign out of the mission

  Background:
    Given that I am a volunteer

  Scenario: Sign In
    When I press "Sign In"
    Then my time will start to be logged

  Scenario: Sign Out
    Given that I am signed in
    When I press "Sign Out"
    Then my time will be logged

