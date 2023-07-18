class User < ApplicationRecord
  require "securerandom"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9]+@[a-z]+\.[a-z]+\z/ }
  validates :password, presence: true
  validates :location, presence: true
  validates :type, presence: true, inclusion: { in: ["Customer", "Admin"] }
end
