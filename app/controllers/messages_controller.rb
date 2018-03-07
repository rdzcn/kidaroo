class MessagesController < ApplicationController
  def new
    @message = Message.new
    @event = Event.find(params[:event_id])
  end

  def create
    @message = Message.new(message_params)
    @event =  Event.find(params[:event_id])
    @message.event = @event
    @message.user = current_user
    @message.save
    # if @message.save
    #   respond_to do |format|
    #     format.html { redirect_to event_path(@message.event) }
    #     format.js  # <-- will render `app/views/reviews/create.js.erb`
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render :new }
    #     format.js  # <-- idem
    #   end
    # end

  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
