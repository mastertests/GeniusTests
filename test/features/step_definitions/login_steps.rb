# frozen_string_literal: true

duration = @large_duration

login_popup = 'header-action--sign_in'
username_field = 'login'
password_field = 'password'
sign_in_button = 'button.square_button'

Given(/^I open login popup$/) do
  @driver.find_element(class: login_popup).click
end

When(/^I input username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  @driver.find_element(name: username_field).send_keys username
  @driver.find_element(name: password_field).send_keys password
end

And(/^I press sign in$/) do
  @driver.find_element(css: sign_in_button).click
  sleep duration
end