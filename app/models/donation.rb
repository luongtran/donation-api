class Donation < ApplicationRecord
	has_many :attachments, as: :attachmentable
	has_and_belongs_to_many :donation_categories

	accepts_nested_attributes_for :donation_categories
	accepts_nested_attributes_for :attachments, allow_destroy: true

	attr_accessor :donation_category_ids

end
