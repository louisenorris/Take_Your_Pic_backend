class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :updated_at
end
