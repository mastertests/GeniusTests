# frozen_string_literal: true

main_page_url = @main_page_url
duration = @small_duration

shop_page_tab_name = 'Shop'
show_more_button_xpath = '//*[@id="top-songs"]/genius-chart//ng-transclude/show-more/div'
last_song_number_xpath = '//*[@id="top-songs"]//transclude-injecting-local-scope[last()]' \
                         '/home-charts-song/a/div[1]/span/span'

Given(/^I open main page$/) do
  @driver.get main_page_url
end

Given(/^I open Shop page$/) do
  @driver.find_element(name: shop_page_tab_name).click
  sleep duration
end

When(/^I click on "([^"]*)" with "([^"]*)" locator$/) do |locator, locator_type|
  element = @driver.find_element("#{locator_type}": locator)
  element.click
  sleep duration
end

When(/^I click on Show More "([^"]*)" times$/) do |number_of_times|
  i = 0
  while i < Integer(number_of_times)
    @driver.find_element(xpath: show_more_button_xpath).click
    i += 1
    sleep duration
  end
end

Then(/^I should see element with "([^"]*)" "([^"]*)"$/) do |locator_type, locator|
  element = @driver.find_element "#{locator_type}": locator
  raise "Fail because element #{locator} is not displayed" unless element.displayed?
end

Then(/^I should not see element with "([^"]*)" "([^"]*)"$/) do |locator_type, locator|
  elements = @driver.find_elements "#{locator_type}": locator
  raise "Fail because element #{locator} is displayed but should not" unless elements.empty?
end

Then(/^I should see "([^"]*)" songs$/) do |number_of_songs|
  element = @driver.find_element xpath: last_song_number_xpath
  raise 'Fail because last song number not that expected' unless element.text == number_of_songs
end
