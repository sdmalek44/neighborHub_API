class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :photo
end
