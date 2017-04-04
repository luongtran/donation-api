class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_fullname
      t.integer :flat_building_number
      t.string :address_line1
      t.text :address_instruction
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
