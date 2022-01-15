class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!, except: [:show, :index, :new, :create]
end

puts I18n.locale

def extract_locale
  parsed_locale = language_params[:lang]
  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
end

private

def set_locale
  I18n.locale = params[:locale] || language_params[:lang] || locale_from_header || I18n.default_locale
end

def locale_from_header
  request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
end

def language_params
  params.permit(:lang)
end