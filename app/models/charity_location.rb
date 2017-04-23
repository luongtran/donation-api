class CharityLocation < ApplicationRecord
	has_many :charities, dependent: :destroy
end
