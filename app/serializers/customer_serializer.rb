class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :location

end
