class Customer < User
  has_many :ratings
  # require 'securerandom'

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9]+@[a-z]+\.[a-z]+\z/ }
  # validates :password, presence: true
  # validates :location, presence: true
end
