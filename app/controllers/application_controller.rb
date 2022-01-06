class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:show, :index]
end
