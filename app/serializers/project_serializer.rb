class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :photo
  has_many :resources

end
