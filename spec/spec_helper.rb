# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha

  config.include Delorean
  config.include Prowellness::Factories

  config.before(:suite) { DatabaseCleaner.strategy = :truncation }
  config.before(:each)  { DatabaseCleaner.start }
  config.after(:each) do 
    back_to_the_present
    DatabaseCleaner.clean
  end
  
end
