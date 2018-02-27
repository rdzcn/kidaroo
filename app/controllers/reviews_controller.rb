class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.where(:id params[:booking_id])
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :provider_rating, :activity_rating)
  end

end
