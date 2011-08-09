require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Enable the asset pipeline
config.assets.enabled = true
config.assets.paths << "#{Rails.root}/app/assets/fonts"

Bundler.require *Rails.groups(:assets) if defined?(Bundler)

module Prowellness
  class Application < Rails::Application
    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.assets.enabled = true
    
    config.middleware.use ExceptionNotifier,
      :email_prefix => "[Prowellness] ",
      :sender_address => %{"notifier" <www-data@127.0.0.1>},
      :exception_recipients => %w{ferblape+prowellness@gmail.com}
  end
end

require 'carrierwave/orm/activerecord'
