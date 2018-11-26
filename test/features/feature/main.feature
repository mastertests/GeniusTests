# language: en
@feature
Feature: Check main page content

  Background: Open Genius page
    Given I open main page

  Scenario Outline: Genius main page should contain elements
    Then I should see element with "<locator_type>" "<locator>"
    Examples: Elements with locator type
      | locator_type | locator          |
      | id           | community        |
      | class        | logo_link        |
      | class        | footer-copyright |

  Scenario Outline: Genius main page should not contain elements
    Then I should not see element with "<locator_type>" "<locator>"
    Examples: Elements with locator type
      | locator_type | locator                                                |
      | xpath        | //a[@href='/new']                                      |
      | xpath        | //a[@href='/forums']                                   |
      | xpath        | //header-admin[@open-header-menus='open_header_menus'] |

  Scenario: Click on Shop should open Shop Page
    When I click on "Shop" with "name" locator
    Then I should see element with "class" "drawer-page-content"

  Scenario Outline: Top songs should has right number
    When I click on Show More "<number_of_times>" times
    Then I should see "<number_of_songs>" songs
    Examples: Number of Show More button click and expected song number
      | number_of_times | number_of_songs |
      | 4               | 50              |
      | 9               | 100             |