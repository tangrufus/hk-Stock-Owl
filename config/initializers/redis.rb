uri = URI.parse(ENV["REDIS_URL"] || 'redis://localhost:6379/')
REDIS = Redis.new(:url => ENV['REDIS_URL'])
