require 'rails_helper'

describe 'GET /api/v1/users/:id' do
  it 'can get a list of all projects for a user' do
    hood = create(:district)
    user1 = User.create(district_id: hood.id,
                        first_name: 'Bob',
                        last_name: 'Jones',
                        username: 'bobjones',
                        email: 'bobjones@email.com',
                        token: 'password')

    get "/api/v1/users/#{user1.id}"

    expect(response).to be_successful

    user = JSON.parse(response.body)

    expect(user['id']).to eq(user1.id)
    expect(user['district_id']).to eq(hood.id)
    expect(user['first_name']).to eq(user1.first_name)
    expect(user['last_name']).to eq(user1.last_name)
    expect(user['username']).to eq(user1.username)
    expect(user['email']).to eq(user1.email)
    expect(user['token']).to eq(user1.token)
  end
  it 'returns 404 if not found' do

    get "/api/v1/users/1"

    expect(response.status).to eq(404)
  end
end
