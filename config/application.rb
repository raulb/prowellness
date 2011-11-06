require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require *Rails.groups(:assets) if defined?(Bundler)

module Prowellness
  class Application < Rails::Application
    config.i18n.default_locale = 'es'

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.assets.enabled = true

    # CSS
    config.assets.precompile += ['reset.css', 'fonts.css','about.css', 'admin.css','articles.css','blog_posts.css','books.css','comments.css','image.css','posts.css','search.css','site.css','user_data.css']

    # JS
    config.assets.precompile += ['about.js','articles.js','books.js','comments.js','images.js','modal_window.js','search.js','user.js']
    

    config.middleware.use ExceptionNotifier,
      :email_prefix => "[Prowellness] ",
      :sender_address => %{"notifier" <ubuntu@li348-253.members.linode.com>},
      :exception_recipients => %w{ferblape+prowellness@gmail.com}
  end
end

require 'carrierwave/orm/activerecord'
