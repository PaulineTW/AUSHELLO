class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_locale

  def index
    @tags = ActsAsTaggableOn::Tag.all
    @filters = params[:keywords]

    if @filters.nil? || !params[:keywords]
      @resources = Resource.all
    else
      @resources = Resource.where(id: Resource.all.tagged_with(@filters, any: true).reject(&:blank?).map(&:id))
    end
    # if params[:query].present?
    #   @resources = Resource.search(params[:query])

    #     @markers = @resources.geocoded.map do |resource|
    #   {
    #     lat: resource.latitude,
    #     lng: resource.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { resource: resource }),
    #   }
    # end
    # else
    #   @resources = Resource.all
    #      @markers = @resources.geocoded.map do |resource|
    #   {
    #     lat: resource.latitude,
    #     lng: resource.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { resource: resource }),
    #   }
    #   end
    # @resources = Resource.all
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

  def resource_params
    params.require(:resource).permit(:name, :description, :address, :website, :phone, :state, :email, :status,:category_list, :user_id)
  end
end
