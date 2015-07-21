require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "active_resource/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module ThePshqEntrepreneur
  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

    config.assets.precompile << 'modernizr.js' 

    config.assets.paths << Rails.root.join('app', 'assets', 'javascripts', 'angular', 'app', 'templates')
  end
end

