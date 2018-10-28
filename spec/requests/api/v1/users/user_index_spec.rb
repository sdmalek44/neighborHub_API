require 'rails_helper'

describe '/api/v1/users' do

  context 'GET /api/v1/users' do
    it 'can get a list of all users' do
      create(:district)
      create_list(:user, 1)

      get '/api/v1/users'

      expect(response).to be_successful

      users = JSON.parse(response.body)

      expect(users.count).to eq(1)
      expect(users[0]['id']).to eq(1)
      expect(users[0]['first_name']).to be_a(String)
      expect(users[0]['last_name']).to be_a(String)
      expect(users[0]['username']).to be_a(String)
      expect(users[0]['neighborhood']).to be_a(String)
      expect(users[0]['email']).to be_a(String)
      expect(users[0]['photo']).to be_a(String)
    end
  end
  context 'POST /api/v1/users' do
    it 'can create a new user' do
      neighborhood = create(:district)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: 'steve',
                last_name: 'malek',
                email: 'stevemalek@gmail.com',
                username: 'stevie12',
                district_id: neighborhood.id,
                token: 'asdf'
              }

      post '/api/v1/users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:id]).to eq(1)
      expect(user[:first_name]).to eq('steve')
      expect(user[:last_name]).to eq('malek')
      expect(user[:username]).to eq('stevie12')
      expect(user[:email]).to eq('stevemalek@gmail.com')
      expect(user[:neighborhood]).to eq(neighborhood.name)
    end
    it 'user exists through password create but not oauth' do
      neighborhood = create(:district)
      user = create(:user)
      user.password = 'thing'
      user.save!

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: user.first_name,
                last_name: user.last_name,
                email: user.email,
                username: user.username,
                district_id: neighborhood.id,
                token: 'asdf'
              }

      post '/api/v1/users', params: body.to_json, headers: headers

      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(new_user[:id]).to eq(1)
      expect(new_user[:first_name]).to eq(user.first_name)
      expect(new_user[:last_name]).to eq(user.last_name)
      expect(new_user[:username]).to eq(user.username)
      expect(new_user[:email]).to eq(user.email)
      expect(new_user[:neighborhood]).to eq(neighborhood.name)
    end
    it 'not all params passed in' do
      neighborhood = create(:district)


      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: 'DAN',
                last_name: 'LAN',
                district_id: neighborhood.id,
                token: 'asdf'
              }

      post '/api/v1/users', params: body.to_json, headers: headers

      new_user = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(new_user[:message]).to eq("Incorrect info! Could not find or create")
    end
    it 'returns user if exists' do
      neighborhood = create(:district)
      user = create(:user)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: user.first_name,
                last_name: user.last_name,
                email: user.email,
                username: user.username,
                district_id: user.district.id,
                token: user.token
              }

      post '/api/v1/users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:id]).to eq(1)
      expect(user[:first_name]).to eq(body[:first_name])
      expect(user[:last_name]).to eq(body[:last_name])
      expect(user[:username]).to eq(body[:username])
      expect(user[:email]).to eq(body[:email])
      expect(user[:neighborhood]).to eq(neighborhood.name)

      expect(User.all.length).to eq(1)
    end
  end

end
