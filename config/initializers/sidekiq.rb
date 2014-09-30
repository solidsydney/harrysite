require 'sidekiq'
Redis.new(db: 3)
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'Franka', :url => 'redis://127.0.0.1:6379/3' }
end

Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'Franka', :url => 'redis://127.0.0.1:6379/3' }
end