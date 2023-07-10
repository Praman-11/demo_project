class Rating < ApplicationRecord
	belongs_to :service
	belongs_to :customer
	validates :feedback, presence: true
	validates :rating, presence: true
	validates :service_id, presence: true
end
