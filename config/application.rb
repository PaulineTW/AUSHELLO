require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AUSHELLO
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.initialize_on_precompile = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    def default_url_options
      { locale: I18n.locale }
    end

    config.i18n.load_path += Dir[Rails.root.join('app', 'config', 'locales', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :es, :ar, :fa]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true
  end
end
