class AddAmountInBookings < ActiveRecord::Migration[5.1]
  def change
    t.monetize :amount, currency: { present: false }
  end
end
