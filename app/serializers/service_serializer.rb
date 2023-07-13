class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :location, :status, :avg_rating, :image
  belongs_to :admin
  has_many :ratings

  def image
    object.image.url
  end
  
end
