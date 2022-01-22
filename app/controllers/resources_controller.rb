class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :set_locale

  def index
    @tags = ActsAsTaggableOn::Tag.all
    categories = params[:keywords]
    location = params[:query]
    place = params[:placeid]
    # if we only filter by categories and have no location
    if place.present?
      @resources = Resource.with_favourites.where(id: place)
    elsif categories.present? && location == ""
      @resources = Resource.with_favourites.where(id: Resource.all.tagged_with(categories, any: true).reject(&:blank?).map(&:id))
    # if we only filter by location, but not categories
    elsif location.present? && categories.nil?
      @resources = Resource.with_favourites.near(location, 20)
    # if we filter by both categories and location
    elsif categories.present? && location != ""
      resources_location = Resource.with_favourites.near(location, 20)
      @resources = resources_location.where(id: resources_location.tagged_with(categories, any: true).reject(&:blank?).map(&:id))
    else
      # no filters applied
      @resources = Resource.with_favourites
    end

    @markers = @resources.geocoded.map do |resource|
      {
        lat: resource.latitude,
        lng: resource.longitude,
        info_window: render_to_string(partial: "info_window", locals: { resource: resource })
      }
    end
  end

  # def marker_info
  #   @resource = Resource.find_by(latitude: params[:latitude], longitude: params[:longitude])
  #   render json: @resource
  # end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    # @resource.user = current_user
    # @resource.status = "Pending"
    if @resource.valid?
      @resource.save
      redirect_to resources_path(@resource)
    else
      render :new
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :description, :address, :website, :phone, :state, :email, :status,:category_list, :user_id)
  end
end
