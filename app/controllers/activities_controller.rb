class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = Activity
      .with_events
      .starting_from_today
      .district
      .with_category(params[:category])
      .with_age_group(params[:age_group])
      .with_city(params[:city])
      .with_latitude_and_longitude(params[:address])

    @markers = @activities.reduce([]) do |array, activity|
      unless activity.latitude.nil?
        array.push({lat: activity.latitude, lng: activity.longitude})
      end

      array
    end
    @no_footer = true
  end

  def new
    @activity = Activity.new
  end

  def show
   @events = @activity.events
   #authorize @activity
   if @activity.latitude && @activity.longitude
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude
      }]
   end
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    #authorize @activity
    if @activity.save
      redirect_to  new_activity_event_path(@activity)
    else
      render :new
    end
  end

  def edit
    #authorize @activity
  end

  def update
    @activity.update(activity_params)
    #authorize @activity
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :price, :address, :district, :category, :age_group, photos: [])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end


