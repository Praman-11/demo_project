class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :services
end
