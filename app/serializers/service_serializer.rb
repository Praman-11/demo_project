class ServiceSerializer < ActiveModel::Serializer
  has_many :ratings
  attributes :id, :service_name, :location, :status, :image, :avg_rating
  # belongs_to :admin
  

  def image
    object.image.url
  end
end
