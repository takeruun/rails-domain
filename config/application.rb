require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.eager_load_paths << Rails.root.join("domain")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # config.middleware.use ActionDispatch::Cookies

    config.middleware.insert_before Rack::Head, ActionDispatch::Cookies
    config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::CacheStore
  end
end

# *** config.api_only = true ***
# $ rails middleware
# use ActionDispatch::HostAuthorization
# use Rack::Sendfile
# use ActionDispatch::Static
# use ActionDispatch::Executor
# use ActionDispatch::ServerTiming
# use ActiveSupport::Cache::Strategy::LocalCache::Middleware
# use Rack::Runtime
# use ActionDispatch::RequestId
# use ActionDispatch::RemoteIp
# use Rails::Rack::Logger
# use ActionDispatch::ShowExceptions
# use ActionDispatch::DebugExceptions
# use ActionDispatch::ActionableExceptions
# use ActionDispatch::Reloader
# use ActionDispatch::Callbacks
# use ActiveRecord::Migration::CheckPending
# use Rack::Head
# use Rack::ConditionalGet
# use Rack::ETag
# use fuga ← config.middleware.use fuga
# run App::Application.routes


## *** config.api_only = false ***
# $ rails middleware
# use ActionDispatch::HostAuthorization
# use Rack::Sendfile
# use ActionDispatch::Static
# use ActionDispatch::Executor
# use ActionDispatch::ServerTiming
# use ActiveSupport::Cache::Strategy::LocalCache::Middleware
# use Rack::Runtime
# use Rack::MethodOverride
# use ActionDispatch::RequestId
# use ActionDispatch::RemoteIp
# use Rails::Rack::Logger
# use ActionDispatch::ShowExceptions
# use ActionDispatch::DebugExceptions
# use ActionDispatch::ActionableExceptions
# use ActionDispatch::Reloader
# use ActionDispatch::Callbacks
# use ActiveRecord::Migration::CheckPending
# use ActionDispatch::Cookies
# use ActionDispatch::Session::CookieStore
# use ActionDispatch::Flash
# use ActionDispatch::ContentSecurityPolicy::Middleware
# use ActionDispatch::PermissionsPolicy::Middleware
# use Rack::Head
# use Rack::ConditionalGet
# use Rack::ETag
# use Rack::TempfileReaper
# run App::Application.routes