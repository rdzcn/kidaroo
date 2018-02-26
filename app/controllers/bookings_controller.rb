
class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    # authorize @booking
  end

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
    # authorize @booking
  end

  def create
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id]) 
    @booking.activity = @activity
    @booking.price = @activity.price
    @booking.provider = @activity.provider
    @booking.user = current_user
    # authorize @booking
    #if @booking.save
    #redirect_to ???? WHERE DO WE WANT TO REDIRECT??????? activity_booking_path(@activity, @booking) # confirmation: + email + sms?
  #else
  render :new
  # end
  end

  def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy
  end



end
