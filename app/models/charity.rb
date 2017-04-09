class Charity < ApplicationRecord
	belongs_to :charity_location
	has_many :donations
end
