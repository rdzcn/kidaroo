class RemoveEndDateFromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :end_date, :date
  end
end
