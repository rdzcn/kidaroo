class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.references :provider, foreign_key: true
      t.string :address
      t.string :photos
      t.date :start_date
      t.date :end_date
      t.string :category
      t.integer :age_group

      t.timestamps
    end
  end
end
