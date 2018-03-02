
class BookingsController < ApplicationController

  def show
    @booking = Booking.where(state: 'paid').find(params[:id])
    # authorize @booking
  end

  def new
    @booking = Booking.new
    @event = Event.find(params[:event_id])
    # authorize @booking
  end

  def create
    @booking = Booking.new(state: "pending")
    @event = Event.find(params[:event_id])
    @booking.event = @event
    @booking.user = current_user
    @booking.amount = @event.activity.price

    # @booking  = Booking.create(activities_sku: @booking.event.activity.sku, amount: @booking.event.activity.price, state: 'pending')
    @booking.save
    redirect_to new_booking_payment_path(@booking)
  end

  def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy
  end
 private

end
