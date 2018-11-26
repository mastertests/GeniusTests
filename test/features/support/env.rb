require 'rubygems'
require 'selenium-webdriver'

@main_page_url = 'https://genius.com/'
@large_duration = 6 # sec
@small_duration = 2 # sec

browser = ENV['BROWSER']
duration = @small_duration

## Creating WebDriver
# Init path to drivers
Selenium::WebDriver::Firefox.driver_path = '../drivers/geckodriver.exe'
Selenium::WebDriver::Chrome.driver_path = '../drivers/chromedriver.exe'
Selenium::WebDriver::Edge.driver_path = '../drivers/MicrosoftWebDriver.exe'

# Init driver and delete possible cookies
Before do
  @driver = case browser
            when 'chrome'
              Selenium::WebDriver.for :chrome
            when 'edge'
              Selenium::WebDriver.for :edge
            else
              Selenium::WebDriver.for :firefox
            end
  @driver.manage.delete_all_cookies
end

# Go fullscreen
Before do
  @driver.manage.window.maximize
end

# Reinit driver after each scenario
After '@feature' do
  @driver.manage.delete_all_cookies
  @driver.quit
  sleep duration
end

# Close browser after all scenario if it didn't
at_exit do
  @driver.quit unless @driver.nil?
end
