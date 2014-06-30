require 'sidekiq'
Redis.new(db: 1)
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'Franka', :url => 'redis://127.0.0.1:6379/1' }
end

Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'Franka', :url => 'redis://127.0.0.1:6379/1' }
end