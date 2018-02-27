class AddSkuToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :sku, :string
  end
end
