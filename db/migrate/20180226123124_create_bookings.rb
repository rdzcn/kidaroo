class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :activity
      t.monetize :amount, currency: { present: false }
      t.timestamps
    end
  end
end
