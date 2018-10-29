require 'rails_helper'

describe 'PATCH /api/v1/users/:id' do
  it 'can update a user' do
    hood = create(:district, id: 1)
    user1 = User.create(district_id: hood.id,
                        first_name: 'Bob',
                        last_name: 'Jones',
                        username: 'bobjones',
                        email: 'bobjones@email.com',
                        password: 'password')

    headers = {
      "Content-Type": 'application/json',
      "Accept": 'application/json'
    }

    body = {username: 'bobbyj'}

    patch "/api/v1/users/#{user1.id}", params: body.to_json, headers: headers

    user = JSON.parse(response.body)

    expect(user['id']).to eq(user1.id)
    expect(user['neighborhood']).to eq(hood.name)
    expect(user['first_name']).to eq(user1.first_name)
    expect(user['last_name']).to eq(user1.last_name)
    expect(user['username']).to eq("bobbyj")
    expect(user['email']).to eq(user1.email)
  end
  it 'returns a 400 if not valid' do
    hood = create(:district, id: 1)
    user1 = User.create(district_id: hood.id,
                        first_name: 'Bob',
                        last_name: 'Jones',
                        username: 'bobjones',
                        email: 'bobjones@email.com',
                        password: 'password')
    user2 = User.create(first_name: 'steve',
                        last_name: 'malek',
                        email: 'stevemalek@gmail.com',
                        username: 'stevie12',
                        district_id: hood.id,
                        password: 'asdf'
                      )

    headers = {
      "Content-Type": 'application/json',
      "Accept": 'application/json'
    }

    body = {email: 'stevemalek@gmail.com'}

    patch "/api/v1/users/#{user1.id}", params: body.to_json, headers: headers

    user = JSON.parse(response.body)
    expect(response.status).to eq(400)
    expect(user["message"]).to eq("Unable to update")

  end
end
