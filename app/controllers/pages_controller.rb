class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @resources = Resource.where(user: current_user)
    # @messages = Message.where(solved: false)
  end

end
