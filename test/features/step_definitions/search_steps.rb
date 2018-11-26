# frozen_string_literal: true

duration = @large_duration

search_field_name = 'q'
search_result_artist_xpath = '//div[text()="Artists"]/following-sibling::*//div[@class="mini_card-title"]'

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
