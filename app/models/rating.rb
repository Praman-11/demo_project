class Rating < ApplicationRecord
  belongs_to :service
  belongs_to :customer
  validates :feedback, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }
  validates :service_id, presence: true
  after_save :update_rating
  private

  def update_rating
    service = self.service
    avg_rating = service.ratings.average(:rating)
    service.update(avg_rating: avg_rating)
  end
 
end
