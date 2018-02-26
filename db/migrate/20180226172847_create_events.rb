class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.references :booking, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
