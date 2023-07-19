class ServiceSerializer < ActiveModel::Serializer
  has_many :ratings
  attributes :id, :service_name, :location, :status, :image, :avg_rating
  
  

  def image
    object.image.url
  end
end
