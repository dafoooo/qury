require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Qury
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Load libraries
    config.autoload_paths.concat [
      Rails.root.join("lib/"),
      Rails.root.join("app/graphql/loaders"),
      Rails.root.join("app/graphql/resolvers")
    ]
    config.before_initialize do
      Dir[Rails.root.join("lib/qury/*")].each do |f|
        require f
      end
    end

    # Config timezone
    config.time_zone = "Asia/Ho_Chi_Minh"

    # Omit unused generation content
    config.generators do |g|
      g.channel assets: false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.system_tests nil
    end
  end
end
