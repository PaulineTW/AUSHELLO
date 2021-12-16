class FavouritesController < ApplicationController

  def create
    @resource = Resource.find(params[:resource_id])
    if @resource.user_id != current_user.id   #You can register favorites other than your own resources
      @favorite = Favourite.create(user_id: current_user.id, resource_id: @resource.id)
    end
  end

  def destroy
    @resource = resource.find(params[:resource_id])
    @favorite = Favourite.find_by(user_id: current_user.id, resource_id: @resource.id)
    @favorite.destroy
  end

end
