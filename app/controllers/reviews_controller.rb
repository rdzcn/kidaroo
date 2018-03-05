class ReviewsController < ApplicationController

  def new
    @booking = Booking.where(state: 'paid').find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    @review.user = @review.booking.user
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def index

  end

  private

  def review_params
    params.require(:review).permit(:content, :provider_rating, :activity_rating)
  end

end
