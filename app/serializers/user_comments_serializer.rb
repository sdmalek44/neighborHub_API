class UserCommentsSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :created_at, :updated_at
end
