class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.references :user, foreign_key: true
      t.string :os
      t.string :token

      t.timestamps
    end
    add_index :devices, [:user_id, :token],     unique: true
  end
end
