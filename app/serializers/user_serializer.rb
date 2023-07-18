class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :location, :type
end
