class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :location, :status, :avg_rating
  belongs_to :admin
  has_many :ratings
end
