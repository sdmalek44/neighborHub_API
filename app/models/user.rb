class User < ApplicationRecord
  validates_presence_of :name, :district_id, :email
  has_many :user_projects
  belongs_to :district
  has_many :projects, through: :user_projects
end
