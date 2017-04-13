class AddFieldsToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :city, :string
    add_column :addresses, :area, :string
    add_column :addresses, :country, :string
  end
end
