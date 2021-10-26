# bundle exec sidekiq -r ./bin/sidekiq_boot.rb -C config/sidekiq.yml
Sidekiq.configure_server do |config|
  config.redis = { namespace: "Sidekiq", url: "redis://redis:6379" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "Sidekiq", url: "redis://redis:6379" }
end

Dir["/app/workers/*.rb"].each { |file| require file }
