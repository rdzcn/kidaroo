class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def show
  end

  def create
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :price)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end


end
