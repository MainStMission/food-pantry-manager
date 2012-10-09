  Feature: In order to track the hours that volunteers give to the mission.
    As a volunteer I want to sign in and out of the mission.

  Background:
    Given a volunteer exists

  Scenario:
    When I signin as the volunteer
    Then the volunteer should be signed in
