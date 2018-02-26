class RemoveStartDateFromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :start_date, :date
  end
end
