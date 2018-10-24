class UserProject < ApplicationRecord
  validates_presence_of :user_id, :project_id, :project_role
  belongs_to :user
  belongs_to :project

  enum project_role: [ :contributer, :owner ]
end
