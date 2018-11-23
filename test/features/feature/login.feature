# language: en
@feature
Feature: Login with valid adn invalid

  Background: I open login page
    Given I open main page
    Given I open login popup

  Scenario: Login with valid data
    When I input username "Tester41734" and password "12345678"
    And I press sign in
    Then I should see element with "class" "header-user_avatar"
    And I should see element with "class" "header-action-label"

  Scenario: Login with invalid data
    When I input username "Invalid_name" and password "Invalid_password"
    And I press sign in
    Then I should see element with "class" "form_message--error"