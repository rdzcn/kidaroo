class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.event = Event.find(params[:id])
    @message.save
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
