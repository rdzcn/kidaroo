class UsersController < ApplicationController

def dashboard
  @user = current_user
  @bookings = Booking.where(user_id: current_user.id)
  @activities = Activity.where(user_id: current_user.id)
  # authorize @user
end

def edit
  @user = current_user
  # authorize @user
end

def update
  @user = current_user
  @user.update(user_params)
  # authorize @user
  redirect_to dashboard_path
end

private

def user_params
  params.require(:user).permit(:address, :email, :first_name, :last_name, :phone_number, avatar: [])
end

end
