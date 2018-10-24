class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :district_id, :email, :photo 
end
