require 'rails_helper'

describe '/api/v1/users' do

  context 'GET /api/v1/users' do
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
  context 'POST /api/v1/users' do
    it 'can get a list of all users' do
      neighborhood = create(:district)
      headers = {
        "Content-Type": 'application/json',
        "Accept": 'application/json'
      }

      body = {
                firstName: 'steve',
                lastName: 'malek',
                email: 'stevemalek@gmail.com',
                userName: 'stevie12',
                neighborhood: district.id,
                token: 'asdf'
              }

      post '/api/v1/users', params: body.to_json, headers: headers

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:id]).to eq(1)
      expect(user[:first_name]).to eq('steve')
      expect(user[:last_name]).to eq('malek')
      expect(user[:username]).to eq('stevie12')
      expect(user[:email]).to eq('stevemalek@gmail.com')
      expect(user[:neighborhood]).to eq(neighborhood.district)
    end
  end
end
