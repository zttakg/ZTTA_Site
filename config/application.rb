require_relative 'boot'

require 'rails/all'
require './lib/logger_formatter'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Temirtulpar
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.load_defaults 5.2
    config.i18n.default_locale = :ru

    config.log_formatter = LoggerFormatter.new
  end
end
