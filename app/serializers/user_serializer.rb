class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :neighborhood, :photo

  def neighborhood
    object.district.name
  end
end
