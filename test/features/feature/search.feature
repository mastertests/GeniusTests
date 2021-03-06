# language: en
@feature
Feature: Artist searching for artist name

  Background: Open Genius page
    Given I open main page

  Scenario Outline: Artists should contain Artist name
    When I input "<artist_name>" in search field
    And I press submit
    Then I should see "<artist_name>" in Artists results
    Examples: Artists names
      | artist_name    |
      | Big Baby Tape  |
      | Boulevard Depo |
      | i61            |

  Scenario: Open first song in top songs should contain context
    When I click on "chart_row-two_line_title_and_artist-title" with "class" locator
    Then I should see element with "class" "cover_art-image"
    And I should see element with "class" "header_with_cover_art-primary_info-title"
    And I should see element with "class" "header_with_cover_art-primary_info-primary_artist"

  Scenario: Open artist page of first song should contain context
    When I click on "chart_row-two_line_title_and_artist-title" with "class" locator
    And I click on "header_with_cover_art-primary_info-primary_artist" with "class" locator
    Then I should see element with "class" "profile_header-avatar"
    And I should see element with "class" "profile_identity-name_iq_and_role_icon"