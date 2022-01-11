class FavouritesController < ApplicationController

  before_action :set_favourite, only: %i[destroy]

  def create
    puts params[:id]
    @favourite = Favourite.new
    # @resource = Resource.find(params[:resource_id])
    # if @resource.user_id != current_user.id   #You can register favourites other than your own resources
    # # @favourite = Favourite.create(user_id: current_user.id, resource_id: @resource.id)
    # end
  end

  def destroy
    @resource = resource.find(params[:resource_id])
    @favourite = Favourite.find_by(user_id: current_user.id, resource_id: @resource.id)
    @favourite.destroy
  end


  private

 def set_favourite
  @resource = Resource.find(params[:resource_id])
  end

end
