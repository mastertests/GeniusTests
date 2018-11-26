# language: en
@feature
Feature: Check shop page content

  Background: Open Shop page
    Given I open main page
    And I open Shop page

  Scenario: Shop page should contain Shop content
    When I click on "hero-CTA" with "class" locator
    Then I should see element with "class" "site-header__logo-link"

  Scenario:
    Then I should see element with "class" "drawer-page-content"
    And I should see element with "class" "icon-cart"