class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_resource, only: %i[favourite]


  def index
    @resources = Resource.all
    @markers = @resources.geocoded.map do |resource|
      {
        lat: resource.latitude,
        lng: resource.longitude,
        info_window: render_to_string(partial: "info_window", locals: { resource: resource })
      }
    end

    def new
      @resource = Resource.new
    end

    def create
      @resource = Resource.new(resource_params)
      @resource.user = current_user
      if @resource.valid?
        @resource.save
        redirect_to resource_path(@resource)
      else
        render :new
      end
    end

    # def favourite
    #   type = params[:type]
    #   case type
    #   when "favourite"
    #     current_user.favourites << @resource
    #     redirect_back fallback_location: resources_path, notice: "You favourited #{@resource.name}"

    #   when "unfavourite"
    #     current_user.favourites.delete(@resource)
    #     redirect_back fallback_location: resources_path, notice: "You unfavourited #{@resource.name}"
    #   else
    #     redirect_back fallback_location: resources_path, notice: 'Nothing happened.'
    #   end
    # end


    def set_resource
    @resource = Resource.find(params[:id])
  end

    def resource_params
      params.require(:resource).permit(:name, :description, :address, :website, :phone, :state, :email, :status,:category_list, :user_id)
    end
  end
end
