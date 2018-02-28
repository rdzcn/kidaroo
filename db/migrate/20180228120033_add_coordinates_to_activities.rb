class AddCoordinatesToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :latitude, :float
    add_column :activities, :longitude, :float
  end
end
