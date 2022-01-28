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

  def review
    @message = Message.find(params[:id])
    @message.solved = true
    @message.save
    redirect_to dashboard_index_path
  end

  private

  def message_params
      params.require(:message).permit(:content, :issue)
  end
end
