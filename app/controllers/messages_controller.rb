class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        @message.user = current_user
        @message.resource = Resource.find(params[:resource_id])
        @message.save
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
