require 'rails_helper'

describe Project, type: :model do
  context 'relationships' do
    it {should have_many :users}
  end

  context 'verifications' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
  end
end
