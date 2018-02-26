class BookingsController < ApplicationController
	def new
		@booking = Booking.new
		@activity = Activity.find(params[:activity_id])
    # authorize @booking
	end

	def create
	@booking = Booking.new(booking_params)
	@activity = Activity.find(params[:activity_id])
	@booking.activity = @activity
	@booking.price = @activity.price

    # @booking.user = current_user
    # authorize @booking
    # if @booking.save
    #   redirect_to activity_booking_path(@activity, @booking) # confirmation: + email + sms?
    # else
    #   render :new
    # end
	end

	def show
	@booking = Booking.find(params[:id])
    # authorize @booking
	end

	def destroy
	@booking = Booking.find(params[:id])
	@booking.destroy
	end

private

	def booking_params
	params.require(:booking).permit(:date_check_in, :date_check_out)
	end

end
