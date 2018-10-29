class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :username, :district_id, :email
  validates_uniqueness_of :email
  has_secure_password
  has_many :user_projects
  belongs_to :district
  has_many :projects, through: :user_projects
  has_many :comments

end
