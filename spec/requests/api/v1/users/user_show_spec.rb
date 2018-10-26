require 'rails_helper'

describe 'GET /api/v1/users/:id' do
  it 'can get a list of all projects for a user' do
    hood = create(:district)
    user = create(:user, district_id: hood.id)

    get "/api/v1/users/#{user.id}"

    expect(response).to be_successful
  end
end
