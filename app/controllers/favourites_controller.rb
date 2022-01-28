class FavouritesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @resource = Resource.find(params[:resource_id])
    @favourite.resource = @resource
    @favourite.save
    redirect_to resources_path, notice: "You favourited #{@resource.name}"
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
  end

end
