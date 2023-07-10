class Service < ApplicationRecord
	belongs_to :admin
	has_many :ratings
	validates :status, inclusion: {in:[ 'open', 'close'], message:"%{value} is not a valid!! you only choise open or closed :( "}
	validates :service_name, presence: true
	validates :location, presence: true
	validates :status, presence: true
end
