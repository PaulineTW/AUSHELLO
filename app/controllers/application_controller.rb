class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
end

# def set_locale
#   if user_signed_in?
#     I18n.locale = current_user.language
#   else
#     I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
#   end
# end

def set_locale
  I18n.locale = :es
end

def locale_from_header
  request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
end

# private

# def configure_permitted_parameters
#   devise_paramter_sanitizer.permit()
# end