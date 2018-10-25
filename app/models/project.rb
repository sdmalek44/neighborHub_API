class Project < ApplicationRecord
  validates_presence_of :title, :description
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :districts, through: :users
  has_many :resources

  def get_project_role(user_id)
    user_projects.find_by(user_id: user_id)
  end
end
