class PagesController < ApplicationController
	skip_before_action :configure_permitted_parameters, if: :devise_controller?, only: [:home]

	def home
		@activities = Activity.all 
		@events = Event.all
	end
end