class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_age, except: [:welcome]
  before_action :set_locale
   
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    if Rails.env.development?
      parsed_locale = params[:hl] || I18n.default_locale
    else
      parsed_locale = { 'ar' => 'es' }[request.host.split('.').last]
    end
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options(options = {})
    if Rails.env.development? && I18n.locale != I18n.default_locale
      { hl: I18n.locale }.merge options
    else
      options
    end
  end

  private
    def authenticate_age
      #cookies.delete :full_age
      unless cookies.signed[:full_age].present? and cookies.signed[:full_age]
        redirect_to welcome_path
      end
    end
end