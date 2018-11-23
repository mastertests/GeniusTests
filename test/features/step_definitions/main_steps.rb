# frozen_string_literal: true

duration = @small_duration

# show_more_button = '//*[@id="top-songs"]//show-more/div'
show_more_button = '//*[@id="top-songs"]/genius-chart//ng-transclude/show-more/div'
last_song_number = '//*[@id="top-songs"]//transclude-injecting-local-scope[last()]' \
                   '/home-charts-song/a/div[1]/span/span'

When(/^I click on "([^"]*)" with "([^"]*)" locator$/) do |locator, locator_type|
  element = @driver.find_element("#{locator_type}": locator)
  element.click
  sleep duration
end

When(/^I click on Show More "([^"]*)" times$/) do |number_of_times|
  i = 0
  while i < Integer(number_of_times)
    @driver.find_element(xpath: show_more_button).click
    i += 1
    sleep duration
  end
end

Then(/^I should see element with "([^"]*)" "([^"]*)"$/) do |locator_type, locator|
  element = @driver.find_element "#{locator_type}": locator
  raise "Fail because element #{locator} is not displayed" unless element.displayed?
end

Then(/^I should see "([^"]*)" songs$/) do |number_of_songs|
  element = @driver.find_element xpath: last_song_number
  raise 'Fail because last song number not that expected' unless element.text == number_of_songs
end