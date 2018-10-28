class DistrictProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :projects

  def projects
    Project.joins(:users, :user_projects).where("users.district_id = #{object.id}").distinct
  end

end
