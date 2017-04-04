class CreateDonationCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :donation_categories do |t|
      t.string :cat_name
      t.boolean :status

      t.timestamps
    end
  end
end
