require 'rails_helper'

describe '/api/v1' do
  context '/projects' do
    it 'GET /api/v1/projects' do
      create_list(:project, 4)
      get '/api/v1/projects'

      expect(response).to be_successful

      projects = JSON.parse(response.body)

      expect(projects.count).to eq(4)
      expect(projects[0]['id']).to eq(1)
      expect(projects[0]['title']).to be_a(String)
      expect(projects[0]['description']).to be_a(String)
      expect(projects[0]['photo']).to be_a(String)
    end
  end
end
