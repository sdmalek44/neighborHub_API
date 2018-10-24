class Comment < ApplicationRecord
  validates_presence_of :user_id, :project_id, :content
  belongs_to :user
  belongs_to :project
end
