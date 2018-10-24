class Project < ApplicationRecord
  validates_presence_of :title, :description
  has_many :user_projects
  has_many :users, through: :user_projects
end
