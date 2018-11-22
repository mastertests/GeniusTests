require 'rubygems'
require 'selenium-webdriver'

browser = ENV['BROWSER'] || 'chrome'
@main_page_url = 'https://genius.com/'

## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = './drivers/geckodriver.exe'
Selenium::WebDriver::Chrome.driver_path = './drivers/chromedriver.exe'
Selenium::WebDriver::Edge.driver_path = './drivers/MicrosoftWebDriver.exe'

# Init driver
Before do
  case browser
  when 'chrome'
    @browser = Selenium::WebDriver.for :chrome
  when 'edge'
    @browser = Selenium::WebDriver.for :edge
  else
    @browser = Selenium::WebDriver.for :firefox
  end
end

# Go fullscreen
Before do
  @browser.manage.window.maximize
end

# Reinit driver after each scenario
After '@feature' do
  @browser.quit
end

# Close browser after all scenario if it didn't
at_exit do
  @browser.quit unless @browser.nil?
end
