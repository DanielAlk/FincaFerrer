class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
   
  def set_locale
    I18n.locale = params[:hl] || I18n.default_locale
  end

  def default_url_options(options = {})
  	if I18n.locale != :es
  		{ hl: I18n.locale }.merge options
    else
      options
    end
  end
end
