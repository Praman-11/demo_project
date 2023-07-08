class Customer < User
	has_many :ratings
	require "securerandom"

	# enum user_role: [:customer, :admin]

	validates :name, presence: true
	validates :email, presence:true, uniqueness: true
	validates :password, presence:true
	validates :location, presence:true
	
end
