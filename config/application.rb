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

    # CSS - PLUGINS
    config.assets.precompile += ['jquery.fileupload-ui.css','nivo-slider.css','ui-theme/jquery-ui.css','ui-theme/jquery.ui.datepicher.css','ui-theme/jquery.ui.theme.css','wysihtml5/stylesheets.css']
    
    # JS - PLUGINS
    config.assets.precompile += ['custom-form-elements.js','easySlider1.7.js','galleria-1.2.5.min.js','galleria.flickr.min.js','jquery.fileupload.js','jquery.sausage.js','jquery.ui.datepicker-es.js','wysihtml5/advanced.js','wysihtml5/wysihtml5-0.2.0.js']

    # CSS
    config.assets.precompile += ['reset.css', 'fonts.css','about.css', 'admin.css','articles.css','blog_posts.css','books.css','comments.css','imagea.css','posts.css','search.css','site.css','user_data.css']
    
    # JS
    config.assets.precompile += ['about.js','articles.js','books.js','comments.js','images.js','modal_window.js','search.js','user.js']
    
    # ###### ADMIN
    

    config.middleware.use ExceptionNotifier,
      :email_prefix => "[Prowellness] ",
      :sender_address => %{"notifier" <ubuntu@li348-253.members.linode.com>},
      :exception_recipients => %w{ferblape+prowellness@gmail.com}
  end
end

require 'carrierwave/orm/activerecord'
