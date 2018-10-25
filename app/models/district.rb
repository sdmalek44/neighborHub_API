class District < ApplicationRecord
  validates_presence_of :name
  has_many :users
  has_many :user_projects, through: :users
  has_many :projects, through: :user_projects
end
