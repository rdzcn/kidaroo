class RemoveActivityIdFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :activity_id, :string
  end
end
