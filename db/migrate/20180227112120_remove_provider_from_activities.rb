class RemoveProviderFromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :provider_id
  end
end
