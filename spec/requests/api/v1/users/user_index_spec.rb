require 'rails_helper'

describe 'GET /api/v1/users' do
  it 'can get a list of all users' do
    create(:district)
    create_list(:user, 4)

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body)

    expect(users.count).to eq(4)
    expect(users[0]['id']).to eq(1)
    expect(users[0]['first_name']).to be_a(String)
    expect(users[0]['last_name']).to be_a(String)
    expect(users[0]['username']).to be_a(String)
    expect(users[0]['district_id']).to be_a(Integer)
    expect(users[0]['email']).to be_a(String)
    expect(users[0]['photo']).to be_a(String)
  end
end
