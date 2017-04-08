class DonationCategory < ApplicationRecord
	has_and_belongs_to_many :donations
end
