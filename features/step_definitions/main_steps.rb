# frozen_string_literal: true

When(/^I click on "([^"]*)" with "([^"]*)" locator$/) do |locator, locator_type|
  element = @browser.find_element("#{locator_type}": locator)
  element.click
end

Then(/^I should see element with "([^"]*)" "([^"]*)"$/) do |locator_type, locator|
  element = @browser.find_element "#{locator_type}": locator
  raise "Fail because element #{locator} is not displayed" unless element.displayed?
end
