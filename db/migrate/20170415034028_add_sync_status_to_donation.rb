class AddSyncStatusToDonation < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :sync_status, :boolean
  end
end
