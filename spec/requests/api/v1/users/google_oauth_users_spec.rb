require 'rails_helper'

describe '/api/v1/google_users' do
  context 'POST /api/v1/google_users' do
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
                password: 'asdf'
              }

      post '/api/v1/google_users', params: body.to_json, headers: headers

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
                password: 'asdf'
              }

      post '/api/v1/google_users', params: body.to_json, headers: headers

      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(new_user[:message]).to eq('Incorrect login method!')
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

      post '/api/v1/google_users', params: body.to_json, headers: headers

      new_user = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(new_user[:message]).to eq("Incorrect parameters given!")
    end
    it 'returns user if exists and correct login method' do
      password = 'thing'
      neighborhood = create(:district)
      user = create(:user)
      user.update(password: password)

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
                password: password
              }

      post '/api/v1/google_users', params: body.to_json, headers: headers

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
