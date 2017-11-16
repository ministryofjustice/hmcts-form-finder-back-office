module Settings
  DEFAULT_GA_TRACKER_ID = 'UA-12345678-12'
  DEFAULT_NOTIFY_TEMPLATE = 'Nothing-to-see-here'

  module_function

  filepath         = File.expand_path('../config/settings.yml', __dir__)
  @h               = YAML.load_file(filepath)
  @config_keys     = @h.keys.map(&:to_sym)

  def live_url
    @h['live_url']
  end

  def ga_tracker_id
    ENV.fetch('GA_TRACKER_ID', DEFAULT_GA_TRACKER_ID)
  end

  def govuk_notify_api_key
    ENV.fetch('govuk_notify_api_key', 'blah')
  end

  def reset_password_notify_template
    ENV.fetch('reset_password_notify_template', DEFAULT_NOTIFY_TEMPLATE)
  end

  def excepted_from_ssl
    @h['excepted_from_ssl']
  end

  def healthcheck_pqa_api_interval
    @h['healthcheck_pqa_api_interval']
  end
end
