class CreateCourierCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :courier_costs do |t|
      t.float :cost

      t.timestamps
    end
  end
end
