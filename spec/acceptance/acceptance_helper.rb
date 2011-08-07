require "spec_helper"
require "steak"
require "capybara/rails"
require "capybara/dsl"
require "selenium"
require "selenium/client"
require "selenium-webdriver"
require "capybara/firebug"

# Put your acceptance spec helpers inside spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Capybara.default_driver = :selenium_with_firebug
