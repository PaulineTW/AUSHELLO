class FavouritesController < ApplicationController

  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @resource = Resource.find(params[:resource_id])
    @favourite.resource = @resource
    @favourite.save
    # redirect_back fallback_location: resource_favourites_path, notice: "You have favourited #{@favourite.resource.name}"
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    # redirect_back fallback_location: favourite_path, notice: "You have unfavourited #{@favourite.resource.name}"
  end

end
