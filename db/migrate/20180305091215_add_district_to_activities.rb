class AddDistrictToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :district, :string
  end
end
