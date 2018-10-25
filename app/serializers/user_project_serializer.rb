class UserProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :photo, :project_role
  has_many :resources

  def project_role
    object.get_project_role(scope[:user_id]).project_role
  end
end
