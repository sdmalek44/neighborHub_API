require 'rails_helper'

RSpec.describe District, type: :model do
  describe 'relationships' do
    it {should have_many :users}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
end
