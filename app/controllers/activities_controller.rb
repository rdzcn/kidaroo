class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = Activity.select("activities.*").joins(:events).where("events.start_date >= ?", Date.today).distinct
    @activities = @activities.where("category ILIKE ?", "%#{params[:category]}%") unless params[:category].blank?
    @activities = @activities.where(age_group: params[:age_group]) if params[:age_group].present? && params[:age_group] != ""
    @activities = @activities.where("district ILIKE ?", params[:city]) unless params[:city].blank?
    @activities = @activities.where.not(latitude: nil, longitude: nil) unless params[:address].blank?
    p params
    raise

    @markers = @activities.map do |activity|
      next if activity.latitude.nil?
      {
        lat: activity.latitude,
        lng: activity.longitude#,
        # infoWindow: { content: render_to_string(partial: "/activities/map_box", locals: { activity: activity }) }
      }
    end
    @markers = @markers.compact
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
    @markers = @markers.compact
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


