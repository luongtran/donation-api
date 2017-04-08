class CreateDonation < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :charity_id
      t.integer :package_cost_id
      t.integer :address_id
      t.float :total_price
      t.integer :number_of_cartons
      t.boolean :is_fragile
      t.integer :wimo_task_id

      t.timestamps
    end
  end
end
