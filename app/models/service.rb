class Service < ApplicationRecord
	belongs_to :admin
	enum :status, {open: 'open', closed: 'closed'}
end
