class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def show
   #authorize @activity
   #if @activity.latitude && @activity.longitude
   # @markers = [{
   #   lat: @activity.latitude,
   #   lng: @activity.longitude
   #   }]
   #end
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.provider = current_user
    #authorize @activity
    if @activity.save
      redirect_to activity_path(@activity)
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
    params.require(:activity).permit(:title, :description, :price)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
