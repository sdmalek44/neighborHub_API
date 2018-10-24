require 'rails_helper'

describe '/api/v1' do
  context '/users' do
    it 'GET /api/v1/users/:id/projects' do
      district = create(:district)
      user = create(:user)
      project = create(:project)
      resources = create_list(:resource, 3)
      user_project = create(:user_project)

      get "/api/v1/users/#{user.id}/projects"

      projects = JSON.parse(response.body, symbolize_names: true)

      expect(projects.count).to eq(1)
      expect(projects[0][:id]).to eq(1)
      expect(projects[0][:title]).to be_a(String)
      expect(projects[0][:description]).to be_a(String)
      expect(projects[0][:project_role]).to be_a(String)
      expect(projects[0][:photo]).to be_a(String)
      expect(projects[0][:resources]).to be_a(Array)
      expect(projects[0][:resources].count).to eq(3)
      expect(projects[0][:resources][0][:id]).to be_a(Integer)
      expect(projects[0][:resources][0][:name]).to be_a(String)
      expect(projects[0][:resources][0][:status]).to be_a(String)
    end
  end
end
