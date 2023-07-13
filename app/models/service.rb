class Service < ApplicationRecord
  belongs_to :admin
  has_many :ratings
  validates :status,
            inclusion: { in: %w[open closed],
                         message: '%<value>s is not a valid!! you only choise open or closed :( ' }
  validates :service_name, presence: true
  validates :location, presence: true
  validates :status, presence: true
  has_one_attached :image
end
