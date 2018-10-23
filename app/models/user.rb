class User < ApplicationRecord
  belongs_to :project
  has_many :projects, class_name: 'Project', foreign_key: :project_owner_id
end
