require 'rails_helper'

describe '/api/v1' do
  context '/projects' do
    it 'GET /api/v1/projects' do
      create_list(:project, 4)
      get '/api/v1/projects'

      expect(response).to be_successful

      neighborhoods = JSON.parse(response.body)

      expect(neighborhoods.count).to eq(4)
      expect(neighborhoods[0]['id']).to eq(1)
      expect(neighborhoods[0]['title']).to be_a(String)
      expect(neighborhoods[0]['description']).to be_a(String)
      expect(neighborhoods[0]['photo']).to be_a(String)
      expect(neighborhoods[0]['created_at']).to be_a(String)
      expect(neighborhoods[0]['updated_at']).to be_a(String)
    end
  end
end
