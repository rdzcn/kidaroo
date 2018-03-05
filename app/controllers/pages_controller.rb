class PagesController < ApplicationController
  skip_before_action :configure_permitted_parameters, if: :devise_controller?, only: [:home]
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end
end
