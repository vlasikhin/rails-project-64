# frozen_string_literal: true

return unless Rails.env.production?

Sentry.init do |config|
  config.dsn = 'https://0cf0a540f77c4929ba11d8eefa140d66@o4504666336919552.ingest.sentry.io/4504666357432320'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
