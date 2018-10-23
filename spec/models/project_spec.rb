require 'rails_helper'

describe Project, type: :model do
  context 'relationships' do
    it {should have_many :users}
    it {should belong_to :project_owner}
  end
end
