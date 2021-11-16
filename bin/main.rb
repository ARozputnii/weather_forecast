require_relative "../lib/bot/api_client"

Bot::ApiClient.start

Dir[File.join("/app/workers", "**/*.rb")].each { |f| require f }

# bundle exec sidekiq -r ./bin/sidekiq_boot.rb -C config/sidekiq.yml
Sidekiq.configure_server do |config|
  config.redis = { namespace: "Sidekiq", url: "redis://redis:6379" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "Sidekiq", url: "redis://redis:6379" }
end
