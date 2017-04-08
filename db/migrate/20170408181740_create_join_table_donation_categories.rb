class CreateJoinTableDonationCategories < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :donations, :donation_categories
  end
end
