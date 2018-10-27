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
  end
end
