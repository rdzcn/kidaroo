
class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    # authorize @booking
  end

  def new
    @booking = Booking.new
    @event = Event.find(params[:event_id])
    # authorize @booking
  end

  def create
    @booking = Booking.new
    @activity = Event.find(params[:activity_id])
    @booking.event = @event
    @booking.price = @event.price
    @booking.user = current_user
    # authorize @booking
  end

  def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy
  end



end
