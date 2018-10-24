class Resource < ApplicationRecord
  validates_presence_of :name, :project_id, :status
  belongs_to :project

  enum status: [ :unfulfilled, :fulfilled]
end
