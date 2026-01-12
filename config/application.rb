# frozen_string_literal: true

require_relative "boot"

# Prevent sassc-rails from being loaded (we use sassc directly for sprockets, not sassc-rails)
module Kernel
  alias_method :require_without_sassc_rails_block, :require unless method_defined?(:require_without_sassc_rails_block)

  def require(name)
    return false if name == "sassc/rails" || name == "sassc/rails/railtie"
    require_without_sassc_rails_block(name)
  end
end

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ComfortableMexicanSofa
  class Application < Rails::Application

    require_relative "../lib/comfortable_mexican_sofa"

    config.load_defaults 7.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Ensuring that all ActiveStorage routes are loaded before out globbing route.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]

    # Making sure we don't load our dev routes as part of the engine
    config.paths["config/routes.rb"] << "config/cms_routes.rb"

    config.active_record.yaml_column_permitted_classes = [
      Symbol,
      Time,
      ActiveSupport::TimeWithZone,
      ActiveSupport::TimeZone,
      ActiveSupport::HashWithIndifferentAccess,
      ActionController::Parameters,
      ActiveSupport::SafeBuffer
    ]

    config.i18n.enforce_available_locales = true

  end
end
