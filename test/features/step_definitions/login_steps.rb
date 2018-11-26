# frozen_string_literal: true

duration = @large_duration

login_popup_class = 'header-action--sign_in'
username_field_name = 'login'
password_field_name = 'password'
sign_in_button_css = 'button.square_button'

Given(/^I open login popup$/) do
  @driver.find_element(class: login_popup_class).click
end

When(/^I input username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  @driver.find_element(name: username_field_name).send_keys username
  @driver.find_element(name: password_field_name).send_keys password
end

When(/^I press sign in$/) do
  @driver.find_element(css: sign_in_button_css).click
  sleep duration
end