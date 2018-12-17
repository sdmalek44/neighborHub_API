class District < ApplicationRecord
  validates_presence_of :name
  has_many :users
  has_many :user_projects, through: :users
  has_many :projects, through: :user_projects

  def projects_where_owner
    Project
      .select("projects.*", "users.first_name as owner", "users.email as contact")
      .joins(:users, :user_projects)
      .where("users.district_id = #{id} and user_projects.project_role = 0")
      .uniq
  end
end
