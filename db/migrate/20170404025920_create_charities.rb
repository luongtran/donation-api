class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.integer :charity_location_id
      t.boolean :status

      t.timestamps
    end
  end
end
