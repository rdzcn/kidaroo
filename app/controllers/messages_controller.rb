class MessagesController < ApplicationController
  def new
    @message = Message.new
    @event = Event.find(params[:event_id])
  end

  def create
    @message = Message.new(message_params)
    @message.event = Event.find(params[:event_id])
    @message.user = current_user
    if @message.save
      redirect_to event_path(@message.event)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
