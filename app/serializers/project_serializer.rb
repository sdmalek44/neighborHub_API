class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :photo, :owner_id
  has_many :resources

  def owner_id
    object.user_projects.where(project_role: "owner")[0].user_id
  end

end
