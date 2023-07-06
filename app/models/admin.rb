class Admin < User
	has_many :services

	validates :name, presence: true
	validates :email, presence:true, uniqueness: true
	validates :password, presence:true
end
