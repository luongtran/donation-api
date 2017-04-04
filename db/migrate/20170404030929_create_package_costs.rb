class CreatePackageCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :package_costs do |t|
      t.string :package_size
      t.float :cost_per_carton

      t.timestamps
    end
  end
end
