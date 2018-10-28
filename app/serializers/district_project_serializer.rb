class DistrictProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :projects

  def projects
    Project.joins(:users, :user_projects)
      .where("users.district_id = #{object.id} and user_projects.project_role = 1")
      .uniq
  end

end
