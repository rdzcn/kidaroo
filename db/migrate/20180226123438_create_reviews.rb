class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :booking, foreign_key: true
      t.text :content
      t.integer :provider_rating
      t.integer :activity_rating

      t.timestamps
    end
  end
end
