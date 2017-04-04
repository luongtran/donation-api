class CreateCharityLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :charity_locations do |t|
      t.string :location_name
      t.boolean :status

      t.timestamps
    end
  end
end
