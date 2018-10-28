class DistrictProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :projects

  def projects
    HoodProjectSerializer.new(
    Project.select("projects.*", "users.first_name as owner", "users.email as contact").joins(:users, :user_projects)
      .where("users.district_id = #{object.id} and user_projects.project_role = 0")
      .uniq).serialize
  end

end
