require 'rails_helper'

RSpec.describe UserProject, type: :model do
  context 'relationships' do
    it {should belong_to :project}
    it {should belong_to :user}
  end
  context 'validations' do
    it {should validate_presence_of :project_id}
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :project_role}
  end
end
