class AddEventToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :event, foreign_key: true
  end
end
