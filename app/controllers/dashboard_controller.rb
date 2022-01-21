class DashboardController < ApplicationController
before_filter :admin_user,     only: [:index]

def admin_user
    redirect_to(root_url) unless current_user.present? && current_user.admin?
end


  def index
    @bookings = Booking.where(user: current_user)
    @my_kitchens_bookings = current_user.kitchens.flat_map{|kitchen|kitchen.bookings}
    @my_kitchens = Kitchen.where(user: current_user)

  end

end
