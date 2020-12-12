class BookComment < ApplicationRecord
	belongs_to :user
	belongs_to :guitar

	validates :comment, presence: true
end
