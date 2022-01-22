class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
# before_action :admin_user,     only: [:index]

# def admin_user
#     redirect_to(root_url) unless current_user.present? && current_user.admin?
# end


  def index
    @resources = Resource.where(user: current_user)
  end



end
