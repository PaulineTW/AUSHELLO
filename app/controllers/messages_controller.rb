class MessagesController < ApplicationController
  def new
    @message= Message.new
    @resource = Resource.find(params[:resource_id])
  end

  def create
      @message = Message.new(message_params)
      @message.user = current_user
      @message.resource = Resource.find(params[:resource_id])
      if @message.save
        redirect_to resources_path
      end
  end

  private

  def message_params
      params.require(:message).permit(:content)
  end
end
