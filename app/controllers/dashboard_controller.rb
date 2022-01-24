class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :resource_params, only: %i[confirmed]
  before_action :find_resource, only: %i[confirmed]

  def index
    @resources = Resource.where(user: current_user)
  end


  # private

  # def resource_params
  #   params.require(:resource).permit(:name, :description, :address, :website, :phone, :state, :email, :status,:category_list, :user_id)
  # end

  # def find_resource
  #   @resource = Resource.find(params[:id])
  # end
end
