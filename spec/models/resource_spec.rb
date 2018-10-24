require 'rails_helper'

RSpec.describe Resource, type: :model do
  context 'relationships' do
    it {should belong_to :project}
  end
  context 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :status}
    it {should validate_presence_of :project_id}
  end
end
