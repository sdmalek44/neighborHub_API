require 'rails_helper'

describe '/api/v1/app_users' do
  context 'POST /api/v1/app_users' do
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
                password: 'bluesky'
              }

      post '/api/v1/app_users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:id]).to eq(1)
      expect(user[:first_name]).to eq('steve')
      expect(user[:last_name]).to eq('malek')
      expect(user[:username]).to eq('stevie12')
      expect(user[:email]).to eq('stevemalek@gmail.com')
      expect(user[:neighborhood]).to eq(neighborhood.name)
    end
    it 'user already exists' do
      neighborhood = create(:district)
      user = create(:user)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: 'Tom',
                last_name: 'Morello',
                email: 'tomo@gmail.com',
                username: 'ToMo',
                district_id: neighborhood.id,
                password: 'bluesky'
              }

      post '/api/v1/app_users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:id]).to eq(1)
      expect(user[:first_name]).to eq('Tom')
      expect(user[:last_name]).to eq('Morello')
      expect(user[:username]).to eq('ToMo')
      expect(user[:email]).to eq('tomo@gmail.com')
      expect(user[:neighborhood]).to eq(neighborhood.name)

      users = User.all
      expect(users.length).to eq(1)
      expect(users.first.password_digest).to be_a(String)
    end
    it 'user does not exist no password given' do
      neighborhood = create(:district)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: 'Tom',
                last_name: 'Morello',
                email: 'tomo@gmail.com',
                username: 'ToMo',
                district_id: neighborhood.id
              }

      post '/api/v1/app_users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(user[:message]).to eq('Could not create user!')


      users = User.all
      expect(users.length).to eq(0)
    end
    it 'user exists no password given' do
      neighborhood = create(:district)
      user = create(:user)

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: 'Tom',
                last_name: 'Morello',
                email: 'tomo@gmail.com',
                username: 'ToMo',
                district_id: neighborhood.id
              }

      post '/api/v1/app_users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(user[:message]).to eq('Could not create user!')


      users = User.all
      expect(users.length).to eq(1)
    end
    it 'user exists wrong password given' do
      neighborhood = create(:district)
      user = create(:user)
      user.password = 'things'
      user.save!

      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                first_name: 'Tom',
                last_name: 'Morello',
                email: 'tomo@gmail.com',
                username: 'ToMo',
                district_id: neighborhood.id,
                password: 'lotafun'
              }

      post '/api/v1/app_users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(user[:message]).to eq('Password Incorrect')


      users = User.all
      expect(users.length).to eq(1)
    end
  end
end
