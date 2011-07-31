require 'spec_helper'
require "steak"
require 'capybara/rails'
require "capybara/dsl"
require 'selenium/client'

# Put your acceptance spec helpers inside spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
