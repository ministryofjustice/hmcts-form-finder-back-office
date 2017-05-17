class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options
    { locale: I18n.locale }
  end

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # SSL Production Config
  if Rails.env.production? && !HostEnv.dev?
    # Force SSL except in excepted routes
    force_ssl unless: :ssl_excepted?
    # Reset session when hitting excepted routes so as not to leak cookie
    before_action :reset_session, if: :ssl_excepted?
  end

  def set_user
    @user = current_user
  end

  protected

  def ssl_excepted?
    Settings.excepted_from_ssl.any? do |excepted_path|
      (request.fullpath =~ Regexp.new(excepted_path))
    end
  end
end
