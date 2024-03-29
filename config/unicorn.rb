worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

    # Kill old resque workers
    # See http://stackoverflow.com/questions/7416318/how-do-i-clear-stuck-stale-resque-workers
    Resque.workers.each {|w| matches = w.id.match(/^[^:]*:([0-9]*):[^:]*$/); pid = matches[1]; w.unregister_worker unless w.worker_pids.include?(pid.to_s)}
    # Inject a resque working into unicorn
    # See https://www.petekeen.net/concurrency-on-heroku-cedar
    @resque_pid ||= spawn("env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=9 QUEUE=ex_document_builder,mailer,* bundle exec rake resque:work")

  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.connection.disconnect!

  if defined?(Resque)
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection(
    Rails.application.config.database_configuration[Rails.env]
  )

  if defined?(Resque)
    Resque.redis = ENV['REDISCLOUD_URL']
    Rails.logger.info('Connected to Redis')
  end
end
