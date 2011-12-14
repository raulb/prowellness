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
    config.assets.paths << "#{Rails.root}/app/assets/fonts"


    # CSS - PLUGINS
    config.assets.precompile += ['jquery.fileupload-ui.css','nivo-slider.css','ui-theme/jquery-ui.css','ui-theme/jquery.ui.datepicher.css','ui-theme/jquery.ui.theme.css','wysihtml5/stylesheets.css']
    
    # CSS
    config.assets.precompile += ['reset.css', 'fonts.css','about.css', 'admin.css','articles.css','blog_posts.css','books.css','comments.css','images.css','posts.css','search.css','site.css','user_data.css','info.css']
    
    # JS
    config.assets.precompile += ['about.js','articles.js','books.js','comments.js','images.js','modal_window.js','search.js','user.js']
    
    # ###### ADMIN
    config.assets.precompile += ['admin/admin.js']

    config.middleware.use ExceptionNotifier,
      :email_prefix => "[Prowellness] ",
      :sender_address => %{"notifier" <ubuntu@li348-253.members.linode.com>},
      :exception_recipients => %w{ferblape+prowellness+ra.barroso@gmail.com}
  end
end

require 'carrierwave/orm/activerecord'
