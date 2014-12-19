CourtsFrontend::Application.configure do
  config.slimmer.logger = Rails.logger
  if Rails.env.production?
    config.slimmer.use_cache = true
  end
end
