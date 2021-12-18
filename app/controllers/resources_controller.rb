class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
     # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @resources.geocoded.map do |resource|
      {
        lat: resource.latitude,
        lng: resource.longitude
      }
    end
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

  private

  def resource_params
    params.require(:resource).permit(:name, :category, :description, :address, :website, :phone, :state, :email, :status)
  end

end
