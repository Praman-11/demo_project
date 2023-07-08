class Service < ApplicationRecord
	belongs_to :admin
	has_many :ratings
	enum :status, {open: 'open', closed: 'closed'}
end
