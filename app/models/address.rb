class Address < ApplicationRecord
	belongs_to :user
	has_many :donations, dependent: :destroy
end
