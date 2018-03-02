class AddAmoutToBookings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :amount_cents, currency: { present: false }
    add_column :bookings, :state, :string
    add_column :bookings, :activities_sku, :string
    add_column :bookings, :payment, :jsonb
  end
end


