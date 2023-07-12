class Rating < ApplicationRecord
  belongs_to :service
  belongs_to :customer
  validates :feedback, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }
  validates :service_id, presence: true
  # validates :location, presence: true
end
