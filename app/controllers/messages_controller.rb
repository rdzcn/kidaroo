class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(request_params)
    @message.user = current_user
    @message.event = Event.find(params[:event_id])
    @message.save

  end

  def destroy
  end
end
