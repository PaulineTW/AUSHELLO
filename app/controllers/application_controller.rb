class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!, except: [:show, :index, :new]
end

def set_locale
    I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
end

# def set_locale
#   I18n.locale = :ar
# end

def locale_from_header
  request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
end
