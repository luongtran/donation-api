class Charity < ApplicationRecord
	include PgSearch


	belongs_to :charity_location
	has_many :donations, dependent: :destroy

	pg_search_scope :index_search, :against => :name
end
