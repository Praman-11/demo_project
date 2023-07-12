class RatingSerializer < ActiveModel::Serializer
  attributes :id, :service_id, :feedback, :rating
  belongs_to :service
  belongs_to :customer
end
