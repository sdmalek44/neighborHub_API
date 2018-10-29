class User < ApplicationRecord
  include BCrypt
  validates_presence_of :first_name, :last_name, :username, :district_id, :email
  validates_uniqueness_of :email
  has_many :user_projects
  belongs_to :district
  has_many :projects, through: :user_projects
  has_many :comments

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
