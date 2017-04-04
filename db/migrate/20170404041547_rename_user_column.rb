class RenameUserColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :name, :fullname
  	remove_column :users, :surname
  end
end
