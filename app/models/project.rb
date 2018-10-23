class Project < ApplicationRecord
  validates_presence_of :title, :description, :project_owner_id
  has_many :users
  belongs_to :project_owner, class_name: 'User', foreign_key: :project_owner_id
end
