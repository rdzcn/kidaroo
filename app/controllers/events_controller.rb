class EventsController < ApplicationController

  def new
    @event = Event.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @event = Event.new(event_params)
    @event.activity = Activity.find(params[:activity_id])
    if @event.save
      redirect_to activity_path(@event.activity)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @message = Message.new
    @no_footer = true
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :end_date)
  end
end
