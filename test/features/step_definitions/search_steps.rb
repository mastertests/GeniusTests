# frozen_string_literal: true

main_page_url = @main_page_url
duration = @large_duration

search_field_name = 'q'
search_result_artist_xpath = '//div[text()="Artists"]/following-sibling::*//div[@class="mini_card-title"]'

Given(/^I open main page$/) do
  @driver.get main_page_url
end

When(/^I input "([^"]*)" in search field$/) do |artist_name|
  @element = @driver.find_element name: search_field_name
  @element.click
  @element.send_keys artist_name
end

When(/^I press submit$/) do
  @element.send_keys :return
  sleep duration
end

Then(/^I should see "([^"]*)" in Artists results$/) do |artist_name|
  element = @driver.find_element xpath: search_result_artist_xpath
  raise 'Fail because not no such artist present' unless element.text.include? artist_name
end
