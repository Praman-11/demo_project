class Rating < ApplicationRecord
	belongs_to :service
	belongs_to :customer
end
