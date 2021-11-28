require_relative "../lib/app_configurator"

# bundle exec sidekiq -r ./bin/sidekiq_boot.rb -C config/sidekiq.yml
Sidekiq.configure_server do |config|
  config.redis = { namespace: "Sidekiq", url: "redis://redis:6379" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "Sidekiq", url: "redis://redis:6379" }
end

Dir[File.join("/app/workers", "**/*.rb")].each { |f| require f }
